import 'package:json_annotation/json_annotation.dart';

part "reset_password.g.dart";

@JsonSerializable()
class Reset_Password {
  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "token")
  final String token;

  @JsonKey(name: "newPassword")
  final String newPassword;

  Reset_Password({
    required this.email,
    required this.token,
    required this.newPassword,
  });

  factory Reset_Password.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$Reset_PasswordFromJson(json);

  Map<String, dynamic> toJson() =>
      _$Reset_PasswordToJson(this);
}