import 'package:flutter/material.dart';

class RecentItemUiModel {
  final String title;
  final String category;
  final String dueText;
  final Color priorityColor;
  final bool isUrgent;

  const RecentItemUiModel({
    required this.title,
    required this.category,
    required this.dueText,
    required this.priorityColor,
    required this.isUrgent,
  });
}
