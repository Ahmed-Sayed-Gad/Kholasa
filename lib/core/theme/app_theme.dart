// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'color_manager.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: ColorManager.primaryDark,

    primaryColor: ColorManager.primary,

    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryDark,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: ColorManager.textColor,
      ),
      titleTextStyle: TextStyle(
        color: ColorManager.textColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),

    colorScheme: ColorScheme.dark(
      primary: ColorManager.primary,
      secondary: ColorManager.primaryBlue,
      surface: ColorManager.secondaryDark,
      error: ColorManager.error,
    ),

    cardColor: ColorManager.secondaryDark,

    dividerColor: ColorManager.borderLight,

    iconTheme: IconThemeData(
      color: ColorManager.textColor,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: ColorManager.textColor,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: ColorManager.textColor,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: ColorManager.textColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: ColorManager.textColor,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.textColorSecondary,
      ),
      bodySmall: TextStyle(
        color: ColorManager.hintTextColor,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.surfaceDark,
      hintStyle: TextStyle(
        color: ColorManager.hintTextColor,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorManager.borderLight,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorManager.borderLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorManager.primary,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    ),

    floatingActionButtonTheme:
    FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary,
      foregroundColor: ColorManager.white,
      elevation: 8,
    ),

    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(
      backgroundColor: ColorManager.surfaceDark,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor:
      ColorManager.disabledText,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: ColorManager.secondaryDark,
      contentTextStyle: TextStyle(
        color: ColorManager.textColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );

  static ThemeData lightTheme = darkTheme;
}