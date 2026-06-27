class ProfileEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  final int totalDocuments;
  final int totalSummaries;
  final int totalFavorites;
  final int hoursSaved;

  final int todayCount;
  final int yesterdayCount;
  final int weekCount;
  final int monthCount;

  final List<String> achievements;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.totalDocuments,
    required this.totalSummaries,
    required this.totalFavorites,
    required this.hoursSaved,
    required this.todayCount,
    required this.yesterdayCount,
    required this.weekCount,
    required this.monthCount,
    required this.achievements,
  });
}