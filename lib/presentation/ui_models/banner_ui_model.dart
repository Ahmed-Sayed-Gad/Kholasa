import 'package:flutter/material.dart';

class HomeBannerUiModel {
  final String title;
  final String subtitle;
  final String badge;
  final IconData icon;
  final List<Color> gradient;
  final String buttonText;

  HomeBannerUiModel({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.icon,
    required this.gradient,
    required this.buttonText,
  });
}
