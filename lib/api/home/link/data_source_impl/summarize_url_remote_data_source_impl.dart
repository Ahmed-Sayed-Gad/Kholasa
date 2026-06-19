import 'package:injectable/injectable.dart';

import '../../../../Data/link/data_source/summarize_url_remote_data_source.dart';
import '../../../../core/errors/handlers/auth_error_handler.dart';
import '../../../../core/errors/result/results.dart';
import '../../../api_client.dart';

@Injectable(as: SummarizeUrlRemoteDataSource)
class SummarizeUrlRemoteDataSourceImpl
    implements SummarizeUrlRemoteDataSource {
  final ApiClient apiClient;
  final AuthErrorHandler errorHandler;

  SummarizeUrlRemoteDataSourceImpl(
      this.apiClient,
      this.errorHandler,
      );

  @override
  Future<Result<String>> summarizeUrl({
    required String url,
    required String language,
    required String format,
    required String length,
    required String sessionId,
  }) async {
    try {
      final response =
      await apiClient.summarizeUrl(
        url,
        language,
        format,
        length,
        sessionId,
      );

      return Success(
        response.data.summary,
      );
    } catch (e) {
      return errorHandler.handle(e as Exception);
    }
  }
}