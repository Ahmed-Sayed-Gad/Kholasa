import 'dart:io';
import 'package:injectable/injectable.dart';

import '../../../domain/summarize/entities/summary_result.dart';
import '../../../domain/summarize/repositories/summarize_repository.dart';
import '../data_source/summarize_fake_data_source.dart';

@LazySingleton(as: SummarizeRepository)
class SummarizeRepositoryImpl
    implements SummarizeRepository {
  final SummarizeFakeDataSource dataSource;

  SummarizeRepositoryImpl(
      this.dataSource,
      );

  @override
  Future<SummaryResult> generateSummary({
    required File file,
    required String length,
    required List<String> focusAreas,
  }) async {
    final result =
    await dataSource.summarize(file);

    return SummaryResult(
      summary: '''
$result

Length: $length

Focus Areas:
${focusAreas.isEmpty ? "General Summary" : focusAreas.join(", ")}
''',
    );
  }
}