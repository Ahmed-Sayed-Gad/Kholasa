import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';
import '../../../core/theme/color_manager.dart';

class FocusAreaChips extends StatelessWidget {
  const FocusAreaChips({super.key});

  static const areas = [
    'Key Points',
    'Methodology',
    'Results',
    'Conclusions',
    'Statistics',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        return Wrap(
          spacing: 8,
          children: areas.map((area) {
            final selected = state.focusAreas.contains(area);

            return ChoiceChip(
              label: Text(area),
              selected: selected,
              selectedColor: ColorManager.primary,
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
