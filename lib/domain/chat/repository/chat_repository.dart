import '../../../core/errors/result/results.dart';

abstract class ChatRepository {
  Future<Result<String>> sendMessage(
      String message,
      );
}