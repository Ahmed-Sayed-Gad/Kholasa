import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';
import '../../../core/theme/color_manager.dart';

class SummaryLengthSlider extends StatelessWidget {
  const SummaryLengthSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Summary Length'),
            Slider(
              value: state.length.index.toDouble(),
              min: 0,
              max: 2,
              divisions: 2,
              activeColor: ColorManager.primary,
              onChanged: (value) {
                context
                    .read<SummarizeCubit>()
                    .changeLength(SummaryLength.values[value.toInt()]);
              },
            ),
          ],
        );
      },
    );
  }
}
