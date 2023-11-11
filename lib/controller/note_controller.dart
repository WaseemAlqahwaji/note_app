
import 'package:flutter/foundation.dart' as h;
import 'package:get/get.dart';
import 'package:note_app/data/local.dart';
import '../model/category/category.dart';
import '../model/note/note.dart';
import '../view/widgets/custom_toast.dart';

class NoteController extends GetxController {
  HiveHelper obj = HiveHelper();
  RxMap<Category, RxMap<int, Note>> notes = <Category, RxMap<int, Note>>{}.obs;

  RxList<Note> favNotes = <Note>[].obs;

  @override
  void onInit() async {
    await obj.onInitHive();
    await initMap();
    await getAllNote();
    super.onInit();
  }

  Future<String> initMap() async {
    for (var element in Category.values) {
      notes.addAll({
        element: <int, Note>{}.obs,
      });
    }
    return Future(() => "init map done");
  }

  Future<void> addNote({
    required Note note,
    required Category category,
  }) async {
    try {
      await obj.putNote(
        category: category,
        json: note.toJson(),
      );
      await getAllNote();
      Get.back();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editNote({
    required Note note,
    required int key,
    required Category category,
    bool isFavEditing = false,
  }) async {
    try {
      await obj.editNote(
        note: note,
        category: category,
        key: key,
      );
      await getAllNote();
      if (!isFavEditing) {
        Get.back();
      }
    } catch (e) {
      if (h.kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getNotes(Map<String, dynamic> tempForConvert){
    obj.boxesMap.forEach((category, value) async {
      value.toMap().forEach((key, value) async {
        var response = await obj.getNote(
          key: key,
          category: category,
        );
        if (response == null) {
          notes[Category.values.byName(category)] = <int, Note>{}.obs;
        } else {
          response.forEach((key, value) {
            tempForConvert.addAll({key.toString(): value});
          });
          Note note = Note.fromJson(tempForConvert);
          notes[Category.values.byName(category)]!.addAll({key: note});
        }
      });
    });
    return Future(() => null);
  }

  Future getAllNote() async {
    try {
      Map<String, dynamic> tempForConvert = {};
      await getNotes(tempForConvert);
      await getFavNotes();
      return notes;
    } catch (e) {
      if (h.kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> deleteNote(int key, Category category) async {
    try {
      await obj.deleteNote(key: key, category: category);
      notes[category]!.remove(key);
      await getFavNotes();
      showToast(text: "item deleted");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getFavNotes() {
    favNotes.clear();
    for (Category category in Category.values) {
      notes[category]!.forEach((key, value) {
        if(value.isFav){
          favNotes.add(value);
        }
      });
    }
    return Future(() => null);
  }
}
