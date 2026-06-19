import 'dart:io';
import 'package:injectable/injectable.dart';

import '../../history/entities/history_item.dart';
import '../../history/repositories/history_repository.dart';
import '../../settings/repositories/settings_repository.dart';
import '../repositories/summarize_repository.dart';

@injectable
@injectable
class GenerateSummaryUseCase {
  final SummarizeRepository summarizeRepository;
  final HistoryRepository historyRepository;
  final SettingsRepository settingsRepository;

  GenerateSummaryUseCase(
      this.summarizeRepository,
      this.historyRepository,
      this.settingsRepository,
      );

  Future<String> call({
    required File file,
    required String length,
    required String language,
    required List<String> focusAreas,
  }) async {
    final result = await summarizeRepository.generateSummary(
      file: file,
      length: length,
      language: language,
      focusAreas: focusAreas,
    );

    // 🔥 TYPE
    final fileName = file.path.toLowerCase();
    String type = "file";

    if (fileName.endsWith(".jpg") || fileName.endsWith(".png")) {
      type = "image";
    } else if (fileName.startsWith("http")) {
      type = "link";
    }

    // 🔥 LANGUAGE
    final isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(result.summary);

    final detectedLanguage = isArabic ? "ar" : "en";
    // 🔥 SAVE
    await historyRepository.saveItem(
      HistoryItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: file.path.split('/').last,
        summary: result.summary,
        createdAt: DateTime.now(),
        isSaved: false,
        type: type,
        language: detectedLanguage,
      ),
    );

    return result.summary;
  }
}
