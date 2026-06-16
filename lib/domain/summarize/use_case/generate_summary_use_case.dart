import 'dart:io';
import 'package:injectable/injectable.dart';

import '../../history/entities/history_item.dart';
import '../../history/repositories/history_repository.dart';
import '../repositories/summarize_repository.dart';

@injectable
class GenerateSummaryUseCase {
  final SummarizeRepository summarizeRepository;
  final HistoryRepository historyRepository;

  GenerateSummaryUseCase(
      this.summarizeRepository,
      this.historyRepository,
      );

  Future<String> call({
    required File file,
    required String length,
    required List<String> focusAreas,
  }) async {
    final result = await summarizeRepository.generateSummary(
      file: file,
      length: length,
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
    final language = isArabic ? "ar" : "en";

    // 🔥 SAVE
    await historyRepository.saveItem(
      HistoryItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: file.path.split('/').last,
        summary: result.summary,
        createdAt: DateTime.now(),
        isSaved: false,
        type: type,
        language: language,
      ),
    );

    return result.summary;
  }
}