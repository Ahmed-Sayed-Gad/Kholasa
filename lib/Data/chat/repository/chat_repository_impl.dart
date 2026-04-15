import 'package:injectable/injectable.dart';

import '../../../domain/chat/entities/chat_message_entity.dart';
import '../../../domain/chat/repository/chat_repository.dart';

import '../datasource/chat_fake_remote_data_source.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatFakeRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<ChatMessageEntity> sendMessage(String message) async {
    return await remoteDataSource.sendMessage(message);
  }
}