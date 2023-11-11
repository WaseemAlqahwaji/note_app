import 'package:flutter/material.dart';

class KTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool? filled;
  final bool? isTitle;

  const KTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.validator,
    this.maxLines,
    this.filled,
    this.isTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        style: isTitle == true ? const TextStyle(fontSize: 26.0) : null,
        maxLines: maxLines,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        obscureText:
            textInputType == TextInputType.visiblePassword ? true : false,
        keyboardType: textInputType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintStyle: isTitle == true ? const TextStyle(fontSize: 26.0) : null,
          hintText: hintText,
          filled: filled,
        ),
      ),
    );
  }
}
