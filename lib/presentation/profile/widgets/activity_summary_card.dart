import 'package:flutter/material.dart';

import '../../../core/theme/color_manager.dart';
import '../../../domain/profile/entities/profile_entity.dart';

class ActivitySummaryCard extends StatelessWidget {
  final ProfileEntity profile;

  const ActivitySummaryCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ActivityRow(
            title: "Today",
            value: "${profile.todayCount} summaries",
          ),

          const Divider(),

          ActivityRow(
            title: "Yesterday",
            value: "${profile.yesterdayCount} summaries",
          ),

          const Divider(),

          ActivityRow(
            title: "This Week",
            value: "${profile.weekCount} summaries",
          ),

          const Divider(),

          ActivityRow(
            title: "This Month",
            value: "${profile.monthCount} summaries",
          ),
        ],
      ),
    );
  }
}

class ActivityRow extends StatelessWidget {
  final String title;
  final String value;

  const ActivityRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        children: [
          Text(title),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}