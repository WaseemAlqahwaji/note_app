import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;
}
