// domain/profile/entities/profile_entity.dart

class ProfileEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
  });
}