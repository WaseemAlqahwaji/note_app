// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KButton extends StatelessWidget {
  final void Function()? onPress;
  final double? width;
  final String title;
  bool? isAddButton = false;

  KButton({
    super.key,
    required this.onPress,
    required this.title,
    this.width,
    this.isAddButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: width == null
          ? const BoxConstraints(maxWidth: double.infinity)
          : null,
      width: width,
      height: 40.h,
      child: isAddButton == null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(30.0.r),
              child: ElevatedButton(
                onPressed: onPress,
                child: Text(title),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(30.0.r),
              child: ElevatedButton(
                onPressed: onPress,
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(title),
                  ],
                ),
              ),
            ),
    );
  }
}
