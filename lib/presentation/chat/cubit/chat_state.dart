import '../../../domain/chat/entities/chat_message_entity.dart';
import '../../../domain/history/entities/history_item.dart';

sealed class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatMessageEntity> messages;
  final bool isTyping;
  final List<HistoryItem> historyItems;
  final HistoryItem? selectedDocument;

  ChatLoaded({
    required this.messages,
    required this.isTyping,
    required this.historyItems,
    this.selectedDocument,
  });

  ChatLoaded copyWith({
    List<ChatMessageEntity>? messages,
    bool? isTyping,
    List<HistoryItem>? historyItems,
    HistoryItem? selectedDocument,
    bool clearSelectedDocument = false,
  }) {
    return ChatLoaded(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
      historyItems: historyItems ?? this.historyItems,
      selectedDocument: clearSelectedDocument ? null : (selectedDocument ?? this.selectedDocument),
    );
  }
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}