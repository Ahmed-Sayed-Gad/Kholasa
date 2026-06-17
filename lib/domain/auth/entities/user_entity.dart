class UserEntity {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  final String name;
  final String email;
  final String role;

  UserEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.name,
    required this.email,
    required this.role,
  });
}