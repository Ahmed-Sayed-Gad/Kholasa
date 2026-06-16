import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_password.g.dart';

@JsonSerializable()
class VerifyResetPassword
{
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyResetPassword
  ({
    this.resetCode,
  });

  factory VerifyResetPassword.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetPasswordFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetPasswordToJson(this);
  }
}


