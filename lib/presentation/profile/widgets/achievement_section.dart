import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class AchievementSection
    extends StatelessWidget {
  const AchievementSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AchievementCard(
            emoji: "🎯",
            title: AppLocalizations.of(context)!.firstSummary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AchievementCard(
            emoji: "🔥",
            title: AppLocalizations.of(context)!.weekStreak,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AchievementCard(
            emoji: "⭐",
            title: AppLocalizations.of(context)!.fiftySummaries,
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
              fontSize: 18,
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