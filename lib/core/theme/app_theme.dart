import 'package:flutter/material.dart';

import 'color_manager.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryDark,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManager.white),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Color(0xFF6366F1),
      labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 12)),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: ColorManager.textColor),
    ),
  );
}
