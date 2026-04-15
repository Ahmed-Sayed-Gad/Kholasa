// lib/presentation/chat/cubit/chat_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/chat/entities/chat_message_entity.dart';

import '../../../domain/chat/usecases/send_message_use_case.dart';
import 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase sendMessageUseCase;

  ChatCubit(this.sendMessageUseCase) : super(ChatInitial()) {
    emit(
      ChatLoaded(
        messages: [
          ChatMessageEntity(
            text:
            "Hello! I'm your AI assistant. How can I help you today?",
            isUser: false,
            createdAt: DateTime.now(),
          ),
        ],
        isTyping: false,
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    if (state is! ChatLoaded) return;

    final current = state as ChatLoaded;

    final userMessage = ChatMessageEntity(
      text: text,
      isUser: true,
      createdAt: DateTime.now(),
    );

    final updatedMessages = [...current.messages, userMessage];

    emit(
      ChatLoaded(
        messages: updatedMessages,
        isTyping: true,
      ),
    );

    try {
      final reply = await sendMessageUseCase(text);

      emit(
        ChatLoaded(
          messages: [...updatedMessages, reply],
          isTyping: false,
        ),
      );
    } catch (e) {
      emit(ChatError('Something went wrong'));
    }
  }
}