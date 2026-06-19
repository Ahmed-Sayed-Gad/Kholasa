class ProfileEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  final int totalSummaries;
  final int savedSummaries;

  final int todayCount;
  final int yesterdayCount;
  final int weekCount;
  final int monthCount;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.totalSummaries,
    required this.savedSummaries,
    required this.todayCount,
    required this.yesterdayCount,
    required this.weekCount,
    required this.monthCount,
  });
}