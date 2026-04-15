class ChatMessageEntity {
  final String text;
  final bool isUser;
  final DateTime createdAt;

  ChatMessageEntity({
    required this.text,
    required this.isUser,
    required this.createdAt,
  });
}