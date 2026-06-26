import 'package:injectable/injectable.dart';

import '../../../Data/chat/datasource/chat_remote_data_source.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../api_client.dart';

@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl
    implements ChatRemoteDataSource {
  final ApiClient apiClient;
  final AuthErrorHandler errorHandler;

  ChatRemoteDataSourceImpl(
      this.apiClient,
      this.errorHandler,
      );

  @override
  Future<Result<String>> sendMessage(
      String message, {
      String? sessionId,
      }) async {
    try {
      final response =
      await apiClient.chat(
        sessionId ?? "default",
        sessionId ?? "default",
        message,
      );

      return Success(
        response.data.response,
      );
    } catch (e) {
      return errorHandler.handle(
        e as Exception,
      );
    }
  }
}