import 'package:injectable/injectable.dart';

import '../entities/chat_message_entity.dart';
import '../repository/chat_repository.dart';

@injectable
class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<ChatMessageEntity> call(String message) {
    return repository.sendMessage(message);
  }
}