import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../../../domain/chat/repository/chat_repository.dart';
import '../datasource/chat_remote_data_source.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl
    implements ChatRepository {
  final ChatRemoteDataSource remote;

  ChatRepositoryImpl(this.remote);

  @override
  Future<Result<String>> sendMessage(
      String message, {
      String? sessionId,
      }) {
    return remote.sendMessage(message, sessionId: sessionId);
  }
}