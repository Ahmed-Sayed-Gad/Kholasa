import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';
import '../widgets/summarize_loading.dart';
import '../widgets/summarize_error.dart';
import '../widgets/summarize_result.dart';
import '../widgets/summary_language_selector.dart';
import '../../../domain/history/entities/history_item.dart';
import 'document_detail_view.dart';
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
          final title = state.file.path.split(RegExp(r'[/\\]')).last;
          final isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(state.result.summary);
          return DocumentDetailView(
            item: HistoryItem(
              id: state.result.sessionId,
              sessionId: state.result.sessionId,
              title: state.result.filename,
              summary: state.result.summary,
              createdAt: DateTime.now(),
              isSaved: state.result.saved,
              type: title.endsWith('.jpg') || title.endsWith('.png')
                  ? 'image'
                  : 'file',
              language: state.result.language,
            )
          );
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
