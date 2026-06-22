import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_manager.dart';

class AppTheme {
  // ================= DARK =================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.primaryDark,
    primaryColor: ColorManager.primary,
    cardColor: ColorManager.secondaryDark,
    dividerColor: ColorManager.borderLight,
    disabledColor: ColorManager.disabledText,
    hintColor: ColorManager.hintTextColor,

    colorScheme: const ColorScheme.dark(
      primary: ColorManager.primary,
      secondary: ColorManager.primaryBlue,
      surface: ColorManager.surfaceDark,
      error: ColorManager.error,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: ColorManager.textColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryDark,
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(
        color: ColorManager.textColor,
      ),
      titleTextStyle: GoogleFonts.outfit(
        color: ColorManager.textColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),

    iconTheme: const IconThemeData(
      color: ColorManager.textColor,
    ),

    textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme).copyWith(
      bodyLarge: GoogleFonts.outfit(textStyle: const TextStyle(color: ColorManager.textColor)),
      bodyMedium: GoogleFonts.outfit(textStyle: const TextStyle(color: ColorManager.textColorSecondary)),
      bodySmall: GoogleFonts.outfit(textStyle: const TextStyle(color: ColorManager.hintTextColor)),
      titleLarge: GoogleFonts.outfit(textStyle: const TextStyle(color: ColorManager.textColor, fontWeight: FontWeight.bold, fontSize: 22)),
      titleMedium: GoogleFonts.outfit(textStyle: const TextStyle(color: ColorManager.textColor, fontWeight: FontWeight.w600, fontSize: 18)),
      titleSmall: GoogleFonts.outfit(textStyle: const TextStyle(color: ColorManager.textColorSecondary, fontWeight: FontWeight.w500, fontSize: 14)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.surfaceDark,
      hintStyle: GoogleFonts.outfit(
        textStyle: const TextStyle(color: ColorManager.hintTextColor),
      ),
      labelStyle: GoogleFonts.outfit(
        textStyle: const TextStyle(color: ColorManager.textColorSecondary),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.borderLight,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.borderLight,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.error,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.error,
          width: 2,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.black,
        textStyle: GoogleFonts.outfit(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
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
    cardColor: Colors.white,
    dividerColor: const Color(0xFFE2E8F0),
    disabledColor: const Color(0xFF94A3B8),
    hintColor: const Color(0xFF64748B),

    colorScheme: const ColorScheme.light(
      primary: ColorManager.primary,
      secondary: ColorManager.primaryBlue,
      surface: Colors.white,
      error: ColorManager.error,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Color(0xFF0F172A),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFF8FAFC),
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: GoogleFonts.outfit(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),

    iconTheme: const IconThemeData(
      color: Colors.black,
    ),

    textTheme: GoogleFonts.outfitTextTheme(ThemeData.light().textTheme).copyWith(
      bodyLarge: GoogleFonts.outfit(textStyle: const TextStyle(color: Color(0xFF0F172A))),
      bodyMedium: GoogleFonts.outfit(textStyle: const TextStyle(color: Color(0xFF334155))),
      bodySmall: GoogleFonts.outfit(textStyle: const TextStyle(color: Color(0xFF64748B))),
      titleLarge: GoogleFonts.outfit(textStyle: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold, fontSize: 22)),
      titleMedium: GoogleFonts.outfit(textStyle: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.w600, fontSize: 18)),
      titleSmall: GoogleFonts.outfit(textStyle: const TextStyle(color: Color(0xFF334155), fontWeight: FontWeight.w500, fontSize: 14)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: GoogleFonts.outfit(
        textStyle: const TextStyle(color: Color(0xFF64748B)),
      ),
      labelStyle: GoogleFonts.outfit(
        textStyle: const TextStyle(color: Color(0xFF334155)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.error,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: ColorManager.error,
          width: 2,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.outfit(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: Color(0xFF94A3B8),
    ),
  );
}