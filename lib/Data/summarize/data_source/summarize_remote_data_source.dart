import 'dart:io';

import '../../../core/errors/result/results.dart';

abstract class SummarizeRemoteDataSource {
  Future<Result<String>> summarize({
    required File file,
    required String language,
    required String format,
    required String length,
    required String sessionId,
  });
}