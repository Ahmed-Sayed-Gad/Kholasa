import '../../../domain/chat/entities/chat_message_entity.dart';

class ChatMessageModel extends ChatMessageEntity {
  ChatMessageModel({
    required super.text,
    required super.isUser,
    required super.createdAt,
  });

  factory ChatMessageModel.fromFakeResponse(String text) {
    return ChatMessageModel(
      text: text,
      isUser: false,
      createdAt: DateTime.now(),
    );
  }
}