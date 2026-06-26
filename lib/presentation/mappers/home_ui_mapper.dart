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
      id: item.id,
      title: item.title,
      summary: item.summary,
      category: item.category,
      dueText: _formatDueDate(item.dueDate),
      isUrgent: isUrgent,
      priorityColor: isUrgent ? Colors.redAccent : Colors.green,
    );
  }

  static String _formatDueDate(DateTime date) {
    final difference = DateTime.now().difference(date);

    if (difference.inMinutes < 1) {
      return 'Just now';
    }

    if (difference.inHours < 1) {
      return '${difference.inMinutes} min ago';
    }

    if (difference.inDays < 1) {
      return '${difference.inHours} hr ago';
    }

    if (difference.inDays == 1) {
      return 'Yesterday';
    }

    return '${difference.inDays} days ago';
  }
}
