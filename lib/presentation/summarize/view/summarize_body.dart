import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';
import '../widgets/summarize_loading.dart';
import '../widgets/summarize_error.dart';
import '../widgets/summarize_result.dart';
import '../widgets/summary_language_selector.dart';
import '../widgets/summary_warning_text.dart';
import '../widgets/summary_length_slider.dart';
import '../widgets/focus_area_chips.dart';
import '../widgets/generate_summary_button.dart';

class SummarizeBody extends StatelessWidget {
  const SummarizeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        if (state is SummarizeLoading) {
          return const SummarizeLoadingView();
        }

        if (state is SummarizeError) {
          return SummarizeErrorView(message: state.message);
        }

        if (state is SummarizeSuccess) {
          return SummarizeResult(summary: state.summary);
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SummaryLengthSlider(),
              SizedBox(height: 16),

              SizedBox(height: 16),

              SummaryLanguageSelector(),

              SizedBox(height: 16),

              // FocusAreaChips(),

              SizedBox(height: 24),

              Center(child: GenerateSummaryButton()),

              SizedBox(height: 12),

              SummaryWarningText(),
            ],
          ),
        );
      },
    );
  }
}
