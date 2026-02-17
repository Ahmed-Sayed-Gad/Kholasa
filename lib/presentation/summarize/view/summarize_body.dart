import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';
import '../widgets/summarize_error.dart';
import '../widgets/summarize_loading.dart';
import '../widgets/summarize_result.dart';
import '../widgets/summary_warning_text.dart';

class SummarizeBody extends StatelessWidget {
  const SummarizeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        if (state is SummarizeLoading) {
          return  SummarizeLoadingView();
        }

        if (state is SummarizeError) {
          return SummarizeErrorView(message: state.message);
        }

        if (state is SummarizeSuccess) {
          return SummarizeResult(result: state.result);
        }

        return const SummaryWarningText();
      },
    );
  }
}
