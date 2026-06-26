import 'package:flutter/material.dart';

class RecentItemUiModel {
  final String id;
  final String title;
  final String summary;
  final String category;
  final String dueText;
  final Color priorityColor;
  final bool isUrgent;

  const RecentItemUiModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.category,
    required this.dueText,
    required this.priorityColor,
    required this.isUrgent,
  });
}
