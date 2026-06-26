class RecentItem {
  final String id;
  final String title;
  final String summary;
  final String category;
  final bool isHighPriority;
  final DateTime dueDate;

  RecentItem({
    required this.id,
    required this.title,
    required this.summary,
    required this.category,
    required this.isHighPriority,
    required this.dueDate,
  });
}
