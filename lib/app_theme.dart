import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff39A552);
  static Color navyColor = const Color(0xff4f5a69);
  static Color blackColor = const Color(0xff303030);
  static Color lightNavyColor = const Color(0xff79828b);
  static Color navyColor2 = const Color(0xff42505C);
  static Color whiteColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: primaryColor,
      foregroundColor: whiteColor,
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: navyColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: navyColor,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: lightNavyColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
    ),
  );
}
