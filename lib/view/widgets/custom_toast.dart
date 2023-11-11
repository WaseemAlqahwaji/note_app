import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/utils/theme.dart';

Future<void> showToast({required String text}){
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: KTheme.mainColor.withOpacity(.7),
      textColor: Colors.white,
      fontSize: 12.0
  );
}