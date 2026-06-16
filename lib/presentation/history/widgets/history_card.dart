import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../../../domain/history/entities/history_item.dart';
import '../cubit/history_cubit.dart';

class HistoryCard extends StatelessWidget {
  final HistoryItem item;

  const HistoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ColorManager.secondaryDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.description,
                color: ColorManager.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: ColorManager.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.summary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ColorManager.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            icon: Icon(
              item.isSaved ? Icons.star : Icons.star_border,
              color: item.isSaved
                  ? Colors.amber
                  : ColorManager.textSecondary,
            ),
            onPressed: () {
              context.read<HistoryCubit>().toggleSaved(item.id);
            },
          ),
        ],
      ),
    );
  }
}
