import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/summarize/use_case/generate_summary_use_case.dart';
import 'summarize_state.dart';
@injectable
class SummarizeCubit extends Cubit<SummarizeState> {
  final GenerateSummaryUseCase generateSummaryUseCase;

  SummarizeCubit(this.generateSummaryUseCase)
      : super(SummarizeInitial(file: File('')));

  void init(File file) {
    emit(SummarizeInitial(file: file));
  }

  void changeLength(SummaryLength length) {
    emit((state as SummarizeInitial).copyWith(length: length));
  }

  void toggleFocusArea(String area) {
    final updated = List<String>.from(state.focusAreas);

    if (updated.contains(area)) {
      updated.remove(area);
    } else {
      updated.add(area);
    }

    emit((state as SummarizeInitial).copyWith(focusAreas: updated));
  }

  Future<void> generateSummary() async {
    emit(SummarizeLoading.from(state));

    try {
      final summary = await generateSummaryUseCase(
        file: state.file,
        length: state.length.name,
        focusAreas: state.focusAreas,
      );

      emit(SummarizeSuccess.from(state, summary));
    } catch (e) {
      emit(SummarizeError.from(state, e.toString()));
    }
  }
}
