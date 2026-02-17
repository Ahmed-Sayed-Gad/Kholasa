import 'package:flutter/material.dart';
import '../../domain/home/entities/home_banner.dart';
import '../../domain/home/entities/recent_Items.dart';
import '../ui_models/banner_ui_model.dart';
import '../ui_models/recent_item_ui_model.dart';

class HomeUiMapper {

  // =====================
  // Banner Mapper
  // =====================
  static HomeBannerUiModel mapBanner(HomeBanner banner) {
    return HomeBannerUiModel(
      title: banner.title,
      subtitle: banner.subtitle,
      badge: 'Active', // UI concern
      icon: Icons.calendar_today,
      gradient: const [
        Color(0xFF6D5DF6),
        Color(0xFF8E4AE8),
      ],
      buttonText: 'View Tasks',
    );
  }

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
