// api/auth/response/profile_response.dart

import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String id;
  final String email;
  final String name;
  final String role;
  final DateTime createdAt;

  ProfileResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.createdAt,
  });

  factory ProfileResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProfileResponseToJson(this);
}