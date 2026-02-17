import "package:flutter/material.dart";
abstract class AppColors{

  static const Color white = Color(0xFFF9F9F9);
  static const Color gray = Color(0xFF535353);
  static const Color lightGray = Color(0xFFA6A6A6);
  static const Color red = Color(0xFFCC1010);
  static const Color green = Color(0xFF11CE19);
  static const Color blue = Color(0xFF02369C);
//##
  static const Color purple = Color(0xFF5679BD);
  static const Color darkWhite = Color(0xFFF9F9F9);
  static const Color lightPrimaryBlue = Color(0xFFDFE7F7);
  static const Color lightGrey = Color(0xFF878787);
  static const Color lightBlue = Color(0xFFEDEFF3);
  static const Color lightGreen = Color(0xFFCAF9CC);
  static const Color lightRed = Color(0xFFF8D2D2);
  static const Color grey = Color(0xFFF9F9F9);
  static const MaterialColor primaryBlue = MaterialColor(
    0xFF02369C,
    <int, Color>{
      50:  Color(0xFFE3EAF6),
      100: Color(0xFFBAC9E8),
      200: Color(0xFF8EA6D9),
      300: Color(0xFF6283C9),
      400: Color(0xFF4168BD),
      500: Color(0xFF02369C),
      600: Color(0xFF023094),
      700: Color(0xFF02288A),
      800: Color(0xFF022080),
      900: Color(0xFF01146E),
    },
  );

  static const MaterialColor black = MaterialColor(0xFF0F0F0F, <int, Color>{
    0: Color(0xFF0F0F0F),
    10: Color(0xFFCFCFCF),
    20: Color(0xFFAFAFAF),
    30: Color(0xFF878787),
    40: Color(0xFF5F5F5F),
    50: Color(0xFF373737),
    60: Color(0xFF0D0D0D),
    70: Color(0xFF0A0A0A),
    80: Color(0xFF080808),
    90: Color(0xFF050505),
    100: Color(0xFF030303),
  });
}