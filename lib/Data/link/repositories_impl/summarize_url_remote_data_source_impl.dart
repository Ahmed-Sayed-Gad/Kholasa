import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../../../domain/link/repositories/summarize_url_repository.dart';
import '../data_source/summarize_url_remote_data_source.dart';

@Injectable(as: SummarizeUrlRepository)
class SummarizeUrlRepositoryImpl
    implements SummarizeUrlRepository {
  final SummarizeUrlRemoteDataSource remote;

  SummarizeUrlRepositoryImpl(this.remote);

  @override
  Future<Result<String>> summarizeUrl({
    required String url,
    required String language,
    required String format,
    required String length,
    required String sessionId,
  }) {
    return remote.summarizeUrl(
      url: url,
      language: language,
      format: format,
      length: length,
      sessionId: sessionId,
    );
  }
}