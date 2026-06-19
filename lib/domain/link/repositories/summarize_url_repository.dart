import '../../../core/errors/result/results.dart';

abstract class SummarizeUrlRepository {
  Future<Result<String>> summarizeUrl({
    required String url,
    required String language,
    required String format,
    required String length,
    required String sessionId,
  });
}