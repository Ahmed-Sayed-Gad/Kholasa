import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';

class SummaryLengthSlider extends StatelessWidget {
  const SummaryLengthSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        return SegmentedButton<SummaryLength>(
          segments: const [
            ButtonSegment(
              value: SummaryLength.short,
              label: Text('Short'),
            ),
            ButtonSegment(
              value: SummaryLength.medium,
              label: Text('Medium'),
            ),
            ButtonSegment(
              value: SummaryLength.long,
              label: Text('Long'),
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