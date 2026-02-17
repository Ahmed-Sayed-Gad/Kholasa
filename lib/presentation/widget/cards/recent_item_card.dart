import 'package:flutter/material.dart';
import '../../ui_models/recent_item_ui_model.dart';
import '../../../core/theme/color_manager.dart';

class RecentItemCard extends StatelessWidget {
  final RecentItemUiModel item;

  const RecentItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ColorManager.secondaryDark,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          _PriorityIndicator(color: item.priorityColor),
          const SizedBox(width: 12),
          Expanded(child: _ItemInfo(item: item)),
          _DueDate(text: item.dueText, isUrgent: item.isUrgent),
        ],
      ),
    );
  }
}

class _ItemInfo extends StatelessWidget {
  final RecentItemUiModel item;

  const _ItemInfo({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            color: ColorManager.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.category,
          style: const TextStyle(
            color: ColorManager.textColorSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _PriorityIndicator extends StatelessWidget {
  final Color color;

  const _PriorityIndicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _DueDate extends StatelessWidget {
  final String text;
  final bool isUrgent;

  const _DueDate({
    required this.text,
    required this.isUrgent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.schedule,
          size: 16,
          color: ColorManager.textColorSecondary,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isUrgent
                ? ColorManager.highPriorityPdf
                : ColorManager.textColorSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

