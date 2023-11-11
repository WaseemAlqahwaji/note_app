import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/theme.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 250.0.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _appNameTitle(),
                  _bookImage(),
                  Text(
                    "Save and share notes",
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  _signUpButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appNameTitle(){
    return FittedBox(
      child: Text.rich(
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20.sp,
        ),
        TextSpan(
          children: [
            TextSpan(
              style: TextStyle(
                color: KTheme.mainColor,
              ),
              text: "Note-Tak",
            ),
            const TextSpan(
              style: TextStyle(color: Colors.black),
              text: "ing App",
            )
          ],
        ),
      ),
    );
  }

  Widget _bookImage() {
    return Container(
      width: 200.w,
      height: 200.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/note_book.png"),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return KButton(
      onPress: () {
        Get.offNamed("/home");
      },
      title: "Start The App",
    );
  }

}
