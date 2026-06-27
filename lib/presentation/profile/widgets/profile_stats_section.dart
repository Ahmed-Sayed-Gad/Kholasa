import 'package:flutter/material.dart';
import '../../../domain/profile/entities/profile_entity.dart';
import '../../../../l10n/app_localizations.dart';

class ProfileStatsSection extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileStatsSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: StatCard(
            title: locale.totalSummaries,
            value: profile.totalSummaries.toString(),
            icon: Icons.article_outlined,
            color: const Color(0xFF22D3EE),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: locale.hoursSaved,
            value: profile.hoursSaved.toString(),
            icon: Icons.access_time_outlined,
            color: const Color(0xFF3B82F6),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: locale.thisWeek,
            value: profile.weekCount.toString(),
            icon: Icons.military_tech_outlined,
            color: const Color(0xFF8B5CF6),
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            value,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7) ?? Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}