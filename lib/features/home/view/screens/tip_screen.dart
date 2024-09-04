import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/tip.dart';
import '../constants/constant.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({super.key});

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {

  final Tip _currentTip = Get.arguments;

  late String tip;

  @override
  void initState() {

    int randomIndex = Random().nextInt(tips[_currentTip]!.length);
    tip = tips[_currentTip]![randomIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      tip,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: 22.0
                      ),
                      speed: const Duration(
                        milliseconds: 30
                      )
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
