import 'package:flutter/material.dart';

abstract class ColorManager {
  // ==================================
  // Brand Colors
  // ==================================
  static const Color primary = Color(0xFF22D3EE);
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color secondaryBlue = Color(0xFF60A5FA);
  static const Color skyBlue = Color(0xFF38BDF8);

  // ==================================
  // Dark Theme Backgrounds
  // ==================================
  static const Color primaryDark = Color(0xFF0F172A);
  static const Color backgroundDark = Color(0xFF020617);
  static const Color secondaryDark = Color(0xFF1E293B);
  static const Color surfaceDark = Color(0xFF141B2E);

  // ==================================
  // Text Colors
  // ==================================
  static const Color textColor = Color(0xFFF8FAFC);
  static const Color textColorSecondary = Color(0xFFCBD5E1);
  static const Color hintTextColor = Color(0xFF94A3B8);
  static const Color disabledText = Color(0xFF717182);

  // ==================================
  // Status Colors
  // ==================================
  static const Color success = Color(0xFF4ADE80);
  static const Color successBg = Color(0x3322C55E);

  static const Color purple = Color(0xFFC084FC);
  static const Color purpleBg = Color(0x33A855F7);

  static const Color highPriorityPdf = Color(0xFFC10007);
  static const Color error = Color(0xFFE61F34);

  // ==================================
  // Utility
  // ==================================
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  static const Color borderLight = Color(0x0DFFFFFF);
  static const Color borderMedium = Color(0x1AFFFFFF);

  // ==================================
  // Compatibility Aliases
  // ==================================
  static const Color textPrimary = textColor;
  static const Color textSecondary = textColorSecondary;
  static const Color textHint = hintTextColor;

  static const Color background = primaryDark;
  static const Color surface = surfaceDark;
  static const Color cardBackground = secondaryDark;

  static const Color dividerColor = borderLight;

  // ==================================
  // Gradient
  // ==================================
  static const LinearGradient primaryGradient =
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF22D3EE),
      Color(0xFF3B82F6),
    ],
  );

  static const LinearGradient darkGradient =
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0F172A),
      Color(0xFF020617),
    ],
  );
}