import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/summarize_cubit.dart';
import '../../../core/theme/color_manager.dart';

class GenerateSummaryButton extends StatelessWidget {
  const GenerateSummaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
          context.read<SummarizeCubit>().generateSummary();
        },
        child: const Text('Generate AI Summary'),
      ),
    );
  }
}
