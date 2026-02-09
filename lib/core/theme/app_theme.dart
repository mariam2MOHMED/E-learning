import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/core/theme/fonts_manager.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
      //backgroundColor: WidgetStatePropertyAll(AppColors.blue),
          foregroundColor: WidgetStatePropertyAll(AppColors.white),
          fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: FontSize.s16, color: AppColors.white),
          ),
        ),
      ),
      textTheme: const TextTheme(

        titleMedium: TextStyle(
          fontSize: FontSize.s20,
          fontWeight: FontWeightManager.medium,
          color: AppColors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.medium,
          color: AppColors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.medium,
          color: AppColors.white
        ),
        bodyMedium: TextStyle(
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.medium,
          color: AppColors.gray,
        ),

      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
          color: AppColors.gray,
          fontWeight: FontWeightManager.medium,
          fontSize: FontSize.s14,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),

        hintStyle: const TextStyle(
          color: AppColors.lightGray,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      colorScheme: colorScheme,
    );
  }

  static ThemeData lightTheme = getTheme(
    ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryBlue[500]!,
      onPrimary: AppColors.primaryBlue[500]!,
      secondary: AppColors.white,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.red,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),
  );
}
