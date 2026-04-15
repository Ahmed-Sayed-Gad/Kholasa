import 'dart:math';

import 'package:injectable/injectable.dart';

import '../models/chat_message_model.dart';

@lazySingleton
class ChatFakeRemoteDataSource {
  Future<ChatMessageModel> sendMessage(String message) async {
    await Future.delayed(const Duration(seconds: 2));

    final responses = [
      "I understand your request. Here's a quick summary.",
      "That's an interesting question. Let me help you.",
      "Based on your message, this is the best response.",
      "I've analyzed your input and prepared an answer.",
      "Sure! Here's what I found for you.",
      "I can definitely help with that.",
    ];

    final random = Random();

    return ChatMessageModel.fromFakeResponse(
      responses[random.nextInt(responses.length)],
    );
  }
}