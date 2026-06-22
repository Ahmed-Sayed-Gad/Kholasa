import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';

import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';

class SummaryLengthSlider extends StatelessWidget {
  const SummaryLengthSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        return SegmentedButton<SummaryLength>(
          segments: [
            ButtonSegment(
              value: SummaryLength.short,
              label: Text(AppLocalizations.of(context)!.shortLength),
            ),
            ButtonSegment(
              value: SummaryLength.medium,
              label: Text(AppLocalizations.of(context)!.mediumLength),
            ),
            ButtonSegment(
              value: SummaryLength.long,
              label: Text(AppLocalizations.of(context)!.longLength),
            ),
          ],
          selected: {
            state.length,
          },
          onSelectionChanged: (value) {
            context
                .read<SummarizeCubit>()
                .changeLength(
              value.first,
            );
          },
        );
      },
    );
  }
}