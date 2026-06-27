// lib/presentation/chat/cubit/chat_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../../../core/services/notification_manager.dart';
import '../../../domain/chat/entities/chat_message_entity.dart';
import '../../../domain/chat/usecases/send_message_use_case.dart';
import '../../../domain/history/entities/history_item.dart';
import '../../../domain/history/use_cases/get_history_use_case.dart';
import 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase sendMessageUseCase;
  final GetHistoryUseCase getHistoryUseCase;
  final NotificationManager notificationManager;

  ChatCubit(
    this.sendMessageUseCase,
    this.getHistoryUseCase,
    this.notificationManager,
  ) : super(ChatInitial()) {
    loadChat();
  }

  void loadChat() {
    final history = getHistoryUseCase();
    emit(
      ChatLoaded(
        messages: [],
        isTyping: false,
        historyItems: history,
        selectedDocument: null,
      ),
    );
  }

  void selectDocument(HistoryItem? document) {
    if (state is! ChatLoaded) return;
    final current = state as ChatLoaded;

    if (document == null) {
      emit(current.copyWith(
        messages: [],
        clearSelectedDocument: true,
      ));
      return;
    }

    emit(current.copyWith(
      selectedDocument: document,
      messages: [
        ChatMessageEntity(
          text: 'Hi! I\'m here to answer questions about "${document.title}". What would you like to know?',
          isUser: false,
          createdAt: DateTime.now(),
        ),
      ],
    ));
  }

  void selectDocumentByTitle(String fileTitle) {
    final history = getHistoryUseCase();
    final matched = history.cast<HistoryItem?>().firstWhere(
      (item) => item?.title == fileTitle,
      orElse: () => null,
    );
    if (matched != null) {
      emit(
        ChatLoaded(
          messages: [
            ChatMessageEntity(
              text: 'Hi! I\'m here to answer questions about "${matched.title}". What would you like to know?',
              isUser: false,
              createdAt: DateTime.now(),
            ),
          ],
          isTyping: false,
          historyItems: history,
          selectedDocument: matched,
        ),
      );
    } else {
      emit(
        ChatLoaded(
          messages: [],
          isTyping: false,
          historyItems: history,
          selectedDocument: null,
        ),
      );
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    if (state is! ChatLoaded) return;

    final current = state as ChatLoaded;
    final selectedDoc = current.selectedDocument;

    final userMessage = ChatMessageEntity(
      text: text,
      isUser: true,
      createdAt: DateTime.now(),
    );

    final updatedMessages = [
      ...current.messages,
      userMessage,
    ];

    emit(
      current.copyWith(
        messages: updatedMessages,
        isTyping: true,
      ),
    );

    final result = await sendMessageUseCase(
      text,
      sessionId: selectedDoc?.sessionId,
    );

    result.fold(
      onSuccess: (response) {
        // Trigger Notification
        notificationManager.chatCompleted(
          selectedDoc?.title ?? "Document",
          selectedDoc?.sessionId ?? '',
        );

        emit(
          current.copyWith(
            messages: [
              ...updatedMessages,
              ChatMessageEntity(
                text: response,
                isUser: false,
                createdAt: DateTime.now(),
              ),
            ],
            isTyping: false,
          ),
        );
      },
      onFailure: (failure) {
        emit(
          ChatError(
            failure.userFriendlyMessage,
          ),
        );
      },
    );
  }
}