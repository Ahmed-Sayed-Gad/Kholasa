import 'dart:io';
import '../entities/summary_result.dart';

abstract class SummarizeRepository {
  Future<SummaryResult> generateSummary({
    required File file,
    required String length,
    required String language,
    required List<String> focusAreas,
  });
}
