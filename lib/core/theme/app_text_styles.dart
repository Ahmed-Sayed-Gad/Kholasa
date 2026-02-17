import 'package:flutter/material.dart';
import 'color_manager.dart';

class AppTextStyles {
  static final headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorManager.textColor,
  );

  static final subtitle = TextStyle(
    fontSize: 14,
    color: ColorManager.textColorSecondary,
  );

  static const cardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const body = TextStyle(
    fontSize: 14,
    height: 1.5,
  );
}
