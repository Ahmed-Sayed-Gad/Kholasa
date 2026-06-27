import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class AchievementSection extends StatelessWidget {
  final List<String> achievements;

  const AchievementSection({
    super.key,
    required this.achievements,
  });

  String _getEmoji(String title) {
    switch (title.trim().toLowerCase()) {
      case 'first summary':
        return '🎯';
      case 'avid reader':
        return '📚';
      case 'week streak':
        return '🔥';
      case '50 summaries':
        return '⭐';
      default:
        return '⭐';
    }
  }

  String _getLocalizedTitle(BuildContext context, String title) {
    final locale = AppLocalizations.of(context)!;
    switch (title.trim().toLowerCase()) {
      case 'first summary':
        return locale.firstSummary;
      case 'week streak':
        return locale.weekStreak;
      case '50 summaries':
        return locale.fiftySummaries;
      case 'avid reader':
        return locale.avidReader;
      default:
        return title;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (achievements.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "No achievements yet",
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 24) / 3;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: achievements.map((title) {
            final emoji = _getEmoji(title);
            final displayTitle = _getLocalizedTitle(context, title);

            return SizedBox(
              width: itemWidth,
              child: AchievementCard(
                emoji: emoji,
                title: displayTitle,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class AchievementCard extends StatelessWidget {
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            emoji,
            style: const TextStyle(
              fontSize: 27,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}