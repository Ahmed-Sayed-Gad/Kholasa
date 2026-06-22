import 'package:flutter/material.dart';

import '../../../domain/profile/entities/profile_entity.dart';
import '../../../../l10n/app_localizations.dart';

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
            title: AppLocalizations.of(context)!.today,
            value: "${profile.todayCount} ${AppLocalizations.of(context)!.summaries}",
          ),

          const Divider(),

          ActivityRow(
            title: AppLocalizations.of(context)!.yesterday,
            value: "${profile.yesterdayCount} ${AppLocalizations.of(context)!.summaries}",
          ),

          const Divider(),

          ActivityRow(
            title: AppLocalizations.of(context)!.thisWeek,
            value: "${profile.weekCount} ${AppLocalizations.of(context)!.summaries}",
          ),

          const Divider(),

          ActivityRow(
            title: AppLocalizations.of(context)!.thisMonth,
            value: "${profile.monthCount} ${AppLocalizations.of(context)!.summaries}",
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
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}