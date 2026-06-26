import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui_models/recent_item_ui_model.dart';
import 'package:project_one_c3_team/core/di/di.dart';
import 'package:project_one_c3_team/presentation/export/cubit/export_cubit.dart';
import 'package:project_one_c3_team/presentation/summarize/widgets/summarize_result.dart';
import 'package:project_one_c3_team/l10n/app_localizations.dart';

class RecentItemCard extends StatelessWidget {
  final RecentItemUiModel item;

  const RecentItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => getIt<ExportCubit>(),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!.summaryTitle),
                ),
                body: SummarizeResult(
                  summary: item.summary,
                  fileTitle: item.title,
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            _PriorityIndicator(
              color: item.priorityColor,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ItemInfo(
                item: item,
              ),
            ),
            _DueDate(
              text: item.dueText,
              isUrgent: item.isUrgent,
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemInfo extends StatelessWidget {
  final RecentItemUiModel item;

  const _ItemInfo({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color,
            fontSize: 11,
            fontWeight:
            FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.category,
          style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyMedium!
                .color,
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}

class _PriorityIndicator
    extends StatelessWidget {
  final Color color;

  const _PriorityIndicator({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
        BorderRadius.circular(4),
      ),
    );
  }
}

class _DueDate extends StatelessWidget {
  final String text;
  final bool isUrgent;

  const _DueDate({
    required this.text,
    required this.isUrgent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.schedule,
          size: 16,
          color: Theme.of(context)
              .textTheme
              .bodyMedium!
              .color,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isUrgent
                ? Theme.of(context)
                .colorScheme
                .error
                : Theme.of(context)
                .textTheme
                .bodyMedium!
                .color,
            fontSize: 8,
            fontWeight:
            FontWeight.w500,
          ),
        ),
      ],
    );
  }
}