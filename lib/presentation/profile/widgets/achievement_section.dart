import 'package:flutter/material.dart';

class AchievementSection
    extends StatelessWidget {
  const AchievementSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: AchievementCard(
            emoji: "🎯",
            title: "First Summary",
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: AchievementCard(
            emoji: "🔥",
            title: "Week Streak",
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: AchievementCard(
            emoji: "⭐",
            title: "50 Summaries",
          ),
        ),
      ],
    );
  }
}

class AchievementCard
    extends StatelessWidget {
  final String emoji;
  final String title;

  const AchievementCard({
    super.key,
    required this.emoji,
    required this.title,
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
            emoji,
            style:
            const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign:
            TextAlign.center,
          ),
        ],
      ),
    );
  }
}