import '../../../domain/chat/entities/chat_message_entity.dart';

sealed class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatMessageEntity> messages;
  final bool isTyping;

  ChatLoaded({
    required this.messages,
    required this.isTyping,
  });
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}