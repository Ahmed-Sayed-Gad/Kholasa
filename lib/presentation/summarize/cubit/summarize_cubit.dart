import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/summarize/use_case/generate_summary_use_case.dart';
import 'summarize_state.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/snackbar_service.dart';
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

      // 🔥 Snackbar داخل التطبيق
      SnackbarService.showSuccess(
        "Summary generated successfully",
      );

      // 🔥 Notification خارج التطبيق
      await NotificationService.showSuccess(
        "Summary generated successfully",
      );

      emit(SummarizeSuccess.from(state, summary));
    } catch (e) {
      SnackbarService.showError(
        "Failed to generate summary",
      );

      await NotificationService.showError(
        "Failed to generate summary",
      );

      emit(
        SummarizeError.from(
          state,
          e.toString(),
        ),
      );
    }
  }}
