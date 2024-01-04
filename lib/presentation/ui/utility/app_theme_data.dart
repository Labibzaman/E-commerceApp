import 'package:flutter/material.dart';

import 'appcolors.dart';

class AppThemeData{
  static ThemeData LightThemeMode =ThemeData(
    primarySwatch:
    MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: Colors.grey.shade500
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}