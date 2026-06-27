import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/services/notification_manager.dart';
import '../../../domain/settings/repositories/settings_repository.dart';
import '../../../domain/summarize/use_case/generate_summary_use_case.dart';
import 'summarize_state.dart';
import '../../../core/services/snackbar_service.dart';

@injectable
class SummarizeCubit extends Cubit<SummarizeState> {
  final GenerateSummaryUseCase generateSummaryUseCase;
  final SettingsRepository settingsRepository;
  final NotificationManager notificationManager;

  SummarizeCubit(
    this.generateSummaryUseCase,
    this.settingsRepository,
    this.notificationManager,
  ) : super(SummarizeInitial(file: File('')));

  void init(File file) {
    emit(SummarizeInitial(file: file));
  }

  void changeLength(SummaryLength length) {
    emit((state as SummarizeInitial).copyWith(length: length));
  }

  void changeLanguage(String language) {
    emit((state as SummarizeInitial).copyWith(language: language));
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

    final fileName = state.file.path.split('/').last.split('\\').last;

    try {
      final result = await generateSummaryUseCase(
        file: state.file,
        length: state.length.name,
        language: state.language,
        focusAreas: state.focusAreas,
      );

      SnackbarService.showSuccess("Summary generated successfully");

      final settings = await settingsRepository.getSettings();

      if (settings.notificationsEnabled) {
        await notificationManager.summaryCompleted(fileName, result.sessionId);
      }

      emit(SummarizeSuccess.from(state, result));
    } catch (e) {
      SnackbarService.showError("Failed to generate summary");

      final settings = await settingsRepository.getSettings();

      if (settings.notificationsEnabled) {
        await notificationManager.summaryFailed(fileName);
      }

      emit(SummarizeError.from(state, e.toString()));
    }
  }
}
