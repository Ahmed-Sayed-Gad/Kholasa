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
    final estimatedHours =
    (profile.totalSummaries * 5 / 60).ceil();

    return Row(
      children: [
        Expanded(
          child: StatCard(
            title: AppLocalizations.of(context)!.summaryTitle,
            value: profile.totalSummaries.toString(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: AppLocalizations.of(context)!.saved,
            value: profile.savedSummaries.toString(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            title: AppLocalizations.of(context)!.hours,
            value: estimatedHours.toString(),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(title),
        ],
      ),
    );
  }
}