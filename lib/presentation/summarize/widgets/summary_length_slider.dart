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
        return Slider(
          value: state.length.index.toDouble(),
          min: 0,
          max: 2,
          divisions: 2,
          onChanged: (v) {
            context.read<SummarizeCubit>()
                .changeLength(SummaryLength.values[v.toInt()]);
          },
        );

      },
    );

  }
}
