import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../features/home/model/category.dart';
import '../features/note/model/note.dart';

class HiveHelper {
  final String _databaseName = 'NoteDB';
  final Set<String> _boxes = {};
  Map<String, Box> boxesMap = {}; // String is the category of the box;

  Future<void> onInitHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    for (Category element in Category.values) {
      _boxes.add(element.name);
    }
    await BoxCollection.open(
      _databaseName,
      _boxes,
      path: directory.path,
    );
    for (String element in _boxes) {
      boxesMap.addIf(
        boxesMap[element] == null,
        element,
         await Hive.openBox(element),
      );
    }
  }

  Future<int> putNote({
    required Category category,
    required Map<String, dynamic> json,
  }) async {
    return await boxesMap[category.name]!.add(json);
  }

  Future getNote({
    required int key,
    required String category,
  }) async {
    return await boxesMap[category]!.get(key);
  }

  Future<void> editNote({
    required Note note,
    required int key,
    required Category category,
  }) async {

    await boxesMap[category.name]!.put(key,note.toJson());
  }

  Future<void> deleteNote({
    required int key,
    required Category category,
  }) async {
     await boxesMap[category.name]!.delete(key);
  }
}
