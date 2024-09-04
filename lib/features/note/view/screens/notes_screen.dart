// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/config/theme.dart';
import 'package:note_app/features/home/view/screens/dashboard_screen.dart';
import 'package:note_app/features/note/view/widgets/custom_bottom_sheet.dart';
import '../../../home/model/category.dart';
import '../../../../components/custom_button.dart';
import '../widgets/custom_note_item.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    super.key,
  });

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  Category currentCategory = Get.arguments;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          currentCategory.name.capitalizeFirst!,
        ),
      ),
      body: GetX<NoteController>(
        init: NoteController(),
        builder: (controller) => ConditionalBuilder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                children: controller.notes[currentCategory]!.keys
                    .map(
                      (index) => NoteItem(
                        index: index,
                        currentCategory: currentCategory,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          fallback: (context) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "There is no notes in ${currentCategory.name.capitalizeFirst}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22.0),
              ),
            ),
          ),
          condition: controller.notes[currentCategory]!.isNotEmpty,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KButton(
            isAddButton: true,
            title: "Add New Note",
            onPress: () async {
              Get.bottomSheet(
                KBottomSheet(
                  category: currentCategory,
                ),
                ignoreSafeArea: false,
                backgroundColor: KTheme.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
