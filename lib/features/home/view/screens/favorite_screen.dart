// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:note_app/utils/extensions.dart';
import '../../../../controller/note_controller.dart';
import '../../../note/view/widgets/custom_note_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  NoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<NoteController>(
          init: NoteController(),
          builder: (controller) {
            return ConditionalBuilder(
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.statusBarHeight + 20.0,
                      ),
                      StaggeredGrid.count(
                        crossAxisCount: 1,
                        children: controller.favNotes.map((element) => NoteItem(
                          note: element,
                        )).toList()
                      ),
                    ],
                  ),
                );
              },
              fallback: (context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: FittedBox(
                      child: Text(
                        "There is no notes in Favorite",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22.0.sp),
                      ),
                    ),
                  ),
                );
              },
              condition: controller.favNotes.isNotEmpty,
            );
          }),
    );
  }
}
