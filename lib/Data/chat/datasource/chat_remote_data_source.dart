import '../../../core/errors/result/results.dart';

abstract class ChatRemoteDataSource {
  Future<Result<String>> sendMessage(
      String message, {
      String? sessionId,
      });
}