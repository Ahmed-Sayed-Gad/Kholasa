import 'dart:io';
import '../repositories/summarize_repository.dart';

class GenerateSummaryUseCase {
  final SummarizeRepository repository;

  GenerateSummaryUseCase(this.repository);

  Future<String> call({
    required File file,
    required String length,
    required List<String> focusAreas,
  }) async {
    final result = await repository.generateSummary(
      file: file,
      length: length,
      focusAreas: focusAreas,
    );

    return result.summary;
  }
}
