import 'dart:io';

import '../../../api/summarize/response/summarize_response.dart';
import '../../../core/errors/result/results.dart';

abstract class SummarizeRemoteDataSource {
  Future<Result<SummarizeResponse>> summarize({
    required File file,
    required String language,
    required String format,
    required String length,
    required String sessionId,
  });
}