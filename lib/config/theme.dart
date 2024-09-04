import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/hex_color.dart';

class KTheme{

  static Color mainColor = HexColor("#6B4EFF") ; // purple;
  static Color secondColor = HexColor("#2A2251"); // dark purple;
  static Color backgroundColor = HexColor("#F2F4F5"); // Scaffold Background Color

  static ThemeData lightMode = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(mainColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.all(12.h),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      hintStyle: TextStyle(color: secondColor),
    ),
    primaryColor: const Color(0x006b4eff),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        size: 16.0.sp,
        color: Colors.grey[600],
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: secondColor,
        fontSize: 20.0.sp,
      ),
      elevation: 0,
      centerTitle: true,
    ),
    fontFamily: 'Nunito',
  );
  static ThemeData darkMode = ThemeData();
}