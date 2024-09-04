// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/features/note/model/note.dart';
import '../../../home/model/category.dart';
import '../../../../config/theme.dart';

class NoteItem extends StatelessWidget {
  final Category? currentCategory;
  final int? index;
  final Note? note;

  NoteItem({
    super.key,
    this.index,
    this.currentCategory,
    this.note,
  });

  NoteController controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: note == null
          ? () {
              Get.toNamed(
                "editNote",
                arguments: {
                  "note": controller.notes[currentCategory]![index],
                  "noteKey": index,
                  "category": currentCategory,
                },
              );
            }
          : null,
      borderRadius: BorderRadius.circular(
        10.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note == null ? controller.notes[currentCategory]![index]!.title : note!.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  note == null ? controller.notes[currentCategory]![index]!.body : note!.body,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: note == null ? () async {
                        Note temp = controller.notes[currentCategory]![index]!;
                        Note note = temp.copyWith(
                          isFav: !temp.isFav,
                        );
                        await controller.editNote(
                          note: note,
                          key: index!,
                          category: currentCategory!,
                          isFavEditing: true,
                        );
                      } : null,
                      child: Icon(
                        note == null ? controller.notes[currentCategory]![index]!.isFav
                            ? Icons.favorite
                            : Icons.favorite_border : Icons.favorite,
                        color: note == null ? controller.notes[currentCategory]![index]!.isFav
                            ? KTheme.mainColor.withOpacity(.7)
                            : Colors.grey[500] : KTheme.mainColor.withOpacity(.7),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        note == null ? controller.notes[currentCategory]![index]!.date : note!.date,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
