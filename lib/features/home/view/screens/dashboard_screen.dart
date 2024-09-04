// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/features/home/model/category.dart';
import '../../model/tip.dart';
import '../../../../config/theme.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  NoteController controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: _profileSection(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: _bodyTitle("Tips For You"),
        ),
        _tipsList(
          context: context,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: _bodyTitle("Note Categorys"),
        ),
        _noteCategoryList(),
      ],
    );
  }

  Widget _profileSection() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Note-Taking App",
        style: TextStyle(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w900,
          color: KTheme.secondColor,
        ),
      ),
    );
  }

  Widget _bodyTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: KTheme.secondColor,
        fontWeight: FontWeight.bold,
        fontSize: 20.0.sp,
      ),
    );
  }

  Widget _tipsList({required BuildContext context}) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: Tip.values.length,
      itemBuilder: (context, index) {
        return _tipsItem(
          index: index,
        );
      },
    );
  }

  Widget _tipsItem({required int index}) {
    if (index >= _tipIcons.length ||
        index >= _tipsColors.length ||
        index >= Tip.values.length) {
      throw Exception(
        "The number of items more than the items in one of the lists",
      );
    }
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          "/tip",
          arguments: Tip.values[index],
        );
      },
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: CircleAvatar(
              backgroundColor: _tipsColors[index].withOpacity(.1),
              radius: double.infinity,
              child: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(_tipsColors[index], BlendMode.srcIn),
                _tipIcons[index],
                fit: BoxFit.none,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            textAlign: TextAlign.center,
            "${Tip.values[index].name.capitalizeFirst}",
            maxLines: 2,
            style:
                TextStyle(fontSize: 12.0.sp, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  Widget _noteCategoryList() {
    return Flexible(
      flex: 40,
      child: LayoutBuilder(
        builder: (context, constraints) => GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            mainAxisExtent:
                constraints.maxHeight / 2 - 10.0, // 10.0 is the spacing
          ),
          itemBuilder: (context, index) => _noteCategoryItem(index),
        ),
      ),
    );
  }

  Widget _noteCategoryItem(int index) {
    if (index >= _noteCategoryIcons.length) {
      throw Exception(
        "itemCount is more than the number of items in the lists",
      );
    }

    return InkWell(
      onTap: () {
        Get.toNamed(
          "/note",
          arguments: Category.values[index],
        );
      },
      borderRadius: BorderRadius.circular(
        20.0,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    colorFilter: ColorFilter.mode(
                      KTheme.mainColor,
                      BlendMode.srcIn,
                    ),
                    _noteCategoryIcons[index],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Text(
                    "${Category.values[index].name.capitalizeFirst} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12.0.sp,
                    ),
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Obx(
                            () => Text(
                              style: TextStyle(
                                fontSize: 12.0.sp,
                              ),
                              "${controller.notes[Category.values[index]]!.length} ",
                            ),
                          ),
                        ),
                        const TextSpan(
                          text: "Notes",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final List<String> _tipIcons = [
    "assets/images/dashboard_images/Black 2.svg",
    "assets/images/dashboard_images/Black 2.svg",
    "assets/images/dashboard_images/Black 2.svg",
    "assets/images/dashboard_images/Black 2.svg",
  ];

  final List<Color> _tipsColors = [
    Colors.blue,
    Colors.green,
    KTheme.mainColor,
    Colors.red,
  ];

  final List<String> _noteCategoryIcons = [
    "assets/images/dashboard_images/work.svg",
    "assets/images/dashboard_images/work.svg",
    "assets/images/dashboard_images/work.svg",
    "assets/images/dashboard_images/work.svg",
  ];
}
