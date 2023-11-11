import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/utils/current_time.dart';
import '../../model/note/note.dart';
import '../widgets/custom_text_form_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
  });

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  NoteController controller = Get.find<NoteController>();

  Map arguments = Get.arguments;


  @override
  void initState() {
    titleController.text = arguments["note"].title;
    bodyController.text = arguments["note"].body;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await editNote();
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await controller.deleteNote(
                  arguments["noteKey"],
                  arguments["category"],
                );
                Get.back();
              },
              icon: Icon(
                Icons.delete_rounded,
                color: Colors.red.withOpacity(.7),
                size: 25.0.r,
              ),
            ),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () async {
              await editNote();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                KTextForm(
                  controller: titleController,
                  hintText: "title",
                  isTitle: true,
                  filled: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                KTextForm(
                  controller: bodyController,
                  filled: false,
                  hintText: "body",
                  textInputType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> editNote() async {
    if (titleController.text == arguments["note"].title &&
        bodyController.text == arguments["note"].body) {
      Get.back();
    } else {
      await controller.editNote(
        note: Note(
          title: titleController.text,
          body: bodyController.text,
          isFav: arguments["note"].isFav,
          date: getCurrentDate(),
        ),
        key: arguments["noteKey"],
        category: arguments["category"],
      );
    }
  }
}
