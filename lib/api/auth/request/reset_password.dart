import 'package:json_annotation/json_annotation.dart';
part "reset_password.g.dart";

@JsonSerializable()
class Reset_Password {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  Reset_Password ({
    this.email,
    this.password,
  });

  factory Reset_Password.fromJson(Map<String, dynamic> json) {
    return _$Reset_PasswordFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Reset_PasswordToJson(this);
  }
}


