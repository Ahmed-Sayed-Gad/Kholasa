import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_password.g.dart';

@JsonSerializable()
class VerifyResetPassword {
  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "token")
  final String token;

  VerifyResetPassword({
    required this.email,
    required this.token,
  });

  factory VerifyResetPassword.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$VerifyResetPasswordFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VerifyResetPasswordToJson(this);
}