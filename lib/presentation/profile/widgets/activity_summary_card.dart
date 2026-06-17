import 'package:flutter/material.dart';

import '../../../core/theme/color_manager.dart';

class ActivitySummaryCard
    extends StatelessWidget {
  const ActivitySummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:
        Theme.of(context).cardColor,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          ActivityRow(
            title: "Today",
            value: "5 summaries",
          ),
          Divider(),
          ActivityRow(
            title: "Yesterday",
            value: "8 summaries",
          ),
          Divider(),
          ActivityRow(
            title: "This Week",
            value: "12 summaries",
          ),
          Divider(),
          ActivityRow(
            title: "This Month",
            value: "47 summaries",
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
      padding:
      const EdgeInsets.symmetric(
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
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}