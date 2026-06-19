import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../repositories/summarize_url_repository.dart';

@injectable
class SummarizeUrlUseCase {
  final SummarizeUrlRepository repository;

  SummarizeUrlUseCase(this.repository);

  Future<Result<String>> call({
    required String url,
    required String language,
    required String format,
    required String length,
    required String sessionId,
  }) {
    return repository.summarizeUrl(
      url: url,
      language: language,
      format: format,
      length: length,
      sessionId: sessionId,
    );
  }
}