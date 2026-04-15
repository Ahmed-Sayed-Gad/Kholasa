import 'package:flutter/material.dart';
import '../../domain/home/entities/home_banner.dart';
import '../../domain/home/entities/recent_Items.dart';
import '../ui_models/recent_item_ui_model.dart';

class HomeUiMapper {

  // =====================
  // Banner Mapper
  // =====================


  // =====================
  // Recent Item Mapper
  // =====================
  static RecentItemUiModel mapRecentItem(RecentItem item) {
    final isUrgent = item.isHighPriority;

    return RecentItemUiModel(
      title: item.title,
      category: item.category,
      dueText: _formatDueDate(item.dueDate),
      isUrgent: isUrgent,
      priorityColor: isUrgent ? Colors.redAccent : Colors.green,
    );
  }

  static String _formatDueDate(DateTime date) {
    final days = date.difference(DateTime.now()).inDays;
    if (days <= 0) return 'Today';
    if (days == 1) return 'Tomorrow';
    return '$days days left';
  }
}
