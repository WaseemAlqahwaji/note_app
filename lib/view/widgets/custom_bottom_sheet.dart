import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/model/category/category.dart';
import 'package:note_app/model/note/note.dart';
import 'package:note_app/utils/validation.dart';

import '../../utils/current_time.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class KBottomSheet extends StatefulWidget {
  final Category category;
  const KBottomSheet({super.key, required this.category});

  @override
  State<KBottomSheet> createState() => _KBottomSheetState();
}

class _KBottomSheetState extends State<KBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NoteController controller = Get.find<NoteController>();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add New Note : ",
                  style: TextStyle(
                    fontSize: 22.0.sp,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              KTextForm(
                controller: titleController,
                hintText: "Title",
                textInputType: TextInputType.text,
                validator: (value) {
                  return KValidation.isEmpty(
                    value: value,
                    formName: "Title",
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              KTextForm(
                controller: bodyController,
                hintText: "body",
                textInputType: TextInputType.text,
                validator: (value) {
                  return KValidation.isEmpty(value: value, formName: "body");
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              KButton(
                onPress: () async {
                  if(formKey.currentState!.validate()){
                    await controller.addNote(
                      note: Note(
                        title: titleController.text,
                        body: bodyController.text,
                        isFav: false,
                        date: getCurrentDate(),
                      ),
                      category: widget.category,
                    );
                  }
                },
                title: "Add",
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
