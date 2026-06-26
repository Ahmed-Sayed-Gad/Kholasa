class HistoryItem {
  final String id;

  final String sessionId;

  final String title;
  final String summary;
  final DateTime createdAt;
  final bool isSaved;
  final String type;
  final String language;

  HistoryItem({
    required this.id,
    required this.sessionId,
    required this.title,
    required this.summary,
    required this.createdAt,
    required this.isSaved,
    required this.type,
    required this.language,
  });
}