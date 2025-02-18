import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: AppColor.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "playfairDisplay",
        fontSize: 25,
      )),
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 28,
    ),
    // ignore: deprecated_member_use
    bodyLarge: TextStyle(
      height: 2, color: AppColor.grey, //fontWeight: FontWeight.bold
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  // fontFamily: "Cairo",
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 28,
    ),
    // ignore: deprecated_member_use
    bodyLarge: TextStyle(
      height: 2, color: AppColor.grey, //fontWeight: FontWeight.bold
    ),
  ),
);
