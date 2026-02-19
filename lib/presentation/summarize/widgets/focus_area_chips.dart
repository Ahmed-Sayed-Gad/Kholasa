import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';

class FocusAreaChips extends StatelessWidget {
  const FocusAreaChips({super.key});

  static const areas = [
    'Key Points',
    'Methodology',
    'Results',
    'Conclusions',
    'Background',
    'Statistics',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: areas.map((area) {
            return ChoiceChip(
              label: Text(area),
              selected: state.focusAreas.contains(area),
              onSelected: (_) {
                context.read<SummarizeCubit>().toggleFocusArea(area);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
