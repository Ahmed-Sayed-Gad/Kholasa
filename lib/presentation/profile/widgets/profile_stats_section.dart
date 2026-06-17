import 'package:flutter/material.dart';

class ProfileStatsSection
    extends StatelessWidget {
  const ProfileStatsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: StatCard(
            title: "Summaries",
            value: "0",
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: "Saved",
            value: "0",
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: "Hours",
            value: "0",
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
        Theme.of(context).cardColor,
        borderRadius:
        BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight:
              FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(title),
        ],
      ),
    );
  }
}