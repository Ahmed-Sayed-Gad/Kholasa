import 'dart:io';

import '../../../domain/summarize/entities/summary_result.dart';

class SummarizeFakeDataSource {
  Future<SummaryResult> summarize(File file) async {
    await Future.delayed(const Duration(seconds: 2));

    return SummaryResult(
      summary: 'This is a fake summary',
      pages: 3,
      language: 'en',
    );
  }
}
