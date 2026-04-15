// lib/core/theme/color_manager.dart

import 'package:flutter/material.dart';

abstract class ColorManager {
  // ==================================
  // Brand Colors
  // ==================================
  static Color primary = const Color(0xFF22D3EE);
  static Color primaryBlue = const Color(0xFF3B82F6);
  static Color secondaryBlue = const Color(0xFF60A5FA);
  static Color skyBlue = const Color(0xFF38BDF8);

  // ==================================
  // Dark Theme Backgrounds
  // ==================================
  static Color primaryDark = const Color(0xFF0F172A);
  static Color backgroundDark = const Color(0xFF020617);
  static Color secondaryDark = const Color(0xFF1E293B);
  static Color surfaceDark = const Color(0xFF141B2E);

  // ==================================
  // Text Colors
  // ==================================
  static Color textColor = const Color(0xFFF8FAFC);
  static Color textColorSecondary = const Color(0xFFCBD5E1);
  static Color hintTextColor = const Color(0xFF94A3B8);
  static Color disabledText = const Color(0xFF717182);

  // ==================================
  // Status Colors
  // ==================================
  static Color success = const Color(0xFF4ADE80);
  static Color successBg = const Color(0x3322C55E);

  static Color purple = const Color(0xFFC084FC);
  static Color purpleBg = const Color(0x33A855F7);

  static Color highPriorityPdf = const Color(0xFFC10007);
  static Color error = const Color(0xFFE61F34);

  // ==================================
  // Utility
  // ==================================
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color transparent = Colors.transparent;

  static Color borderLight = const Color(0x0DFFFFFF);
  static Color borderMedium = const Color(0x1AFFFFFF);

  // ==================================
  // Gradient
  // ==================================
  static LinearGradient primaryGradient =
  const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF22D3EE),
      Color(0xFF3B82F6),
    ],
  );

  static LinearGradient darkGradient =
  const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0F172A),
      Color(0xFF020617),
    ],
  );
}