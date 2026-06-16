
import 'package:json_annotation/json_annotation.dart';

part 'change_profile_password_response.g.dart';

@JsonSerializable()
class ChangeProfilePasswordResponse {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "token")
  final String token;

  ChangeProfilePasswordResponse({
    required this.message,
    required this.token,
  });

  factory ChangeProfilePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeProfilePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeProfilePasswordResponseToJson(this);
}
