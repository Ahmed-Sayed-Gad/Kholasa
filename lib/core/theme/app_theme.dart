import 'package:flutter/material.dart';
import 'color_manager.dart';

class AppTheme {
  // ================= DARK =================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.primaryDark,
    primaryColor: ColorManager.primary,

    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryDark,
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(
        color: ColorManager.textColor,
      ),
      titleTextStyle: const TextStyle(
        color: ColorManager.textColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),

    cardColor: ColorManager.secondaryDark,
    dividerColor: ColorManager.borderLight,

    iconTheme: const IconThemeData(
      color: ColorManager.textColor,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorManager.textColor),
      bodyMedium: TextStyle(color: ColorManager.textColorSecondary),
      bodySmall: TextStyle(color: ColorManager.hintTextColor),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.surfaceDark,
      hintStyle: const TextStyle(
        color: ColorManager.hintTextColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.borderLight,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.black,
      ),
    ),

    bottomNavigationBarTheme:
    const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.surfaceDark,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.disabledText,
    ),
  );

  // ================= LIGHT =================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    primaryColor: ColorManager.primary,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF8FAFC),
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),

    cardColor: Colors.white,
    dividerColor: Color(0xFFE2E8F0),

    iconTheme: const IconThemeData(
      color: Colors.black,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Color(0xFF334155)),
      bodySmall: TextStyle(color: Color(0xFF64748B)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(
        color: Color(0xFF64748B),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFFE2E8F0),
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.black,
      ),
    ),

    bottomNavigationBarTheme:
    const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: Color(0xFF94A3B8),
    ),
  );
}