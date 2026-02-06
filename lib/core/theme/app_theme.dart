import 'package:elearning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(colorScheme: colorScheme);
  }

  static ThemeData lightTheme = getTheme(
    ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryBlue[500]!,
      onPrimary: AppColors.primaryBlue[500]!,
      secondary: AppColors.white,
      onSecondary:AppColors.white,
      error: AppColors.red,
      onError: AppColors.red,
      surface: AppColors.white,
      onSurface: AppColors.primaryBlue,
    ),
  );
}
