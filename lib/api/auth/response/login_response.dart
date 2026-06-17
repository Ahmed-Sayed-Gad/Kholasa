import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool success;
  final String? message;
  final LoginData data;

  LoginResponse({
    required this.success,
    this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String email;
  final String name;
  final String role;

  LoginData({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.email,
    required this.name,
    required this.role,
  });

  factory LoginData.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginDataToJson(this);
}