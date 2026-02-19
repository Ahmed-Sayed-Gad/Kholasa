import 'dart:io';
import '../../../domain/summarize/repositories/summarize_repository.dart';
import '../../../domain/summarize/entities/summary_result.dart';
import '../data_source/summarize_fake_data_source.dart';

class SummarizeRepositoryImpl implements SummarizeRepository {
  final SummarizeFakeDataSource dataSource;

  SummarizeRepositoryImpl(this.dataSource);

  @override
  Future<SummaryResult> generateSummary({
    required File file,
    required String length,
    required List<String> focusAreas,
  }) async {
    final summary = await dataSource.summarize(file);
    return SummaryResult(summary: summary);
  }
}
