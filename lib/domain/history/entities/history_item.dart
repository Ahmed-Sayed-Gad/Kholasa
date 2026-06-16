class HistoryItem {
  final String id;
  final String title;
  final String summary;
  final DateTime createdAt;
  final bool isSaved;

  final String type;     // file | image | link
  final String language; // ar | en

  HistoryItem({
    required this.id,
    required this.title,
    required this.summary,
    required this.createdAt,
    required this.isSaved,
    required this.type,
    required this.language,
  });
}