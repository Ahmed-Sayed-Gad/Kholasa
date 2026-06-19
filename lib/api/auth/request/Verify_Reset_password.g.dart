// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetPassword _$VerifyResetPasswordFromJson(Map<String, dynamic> json) =>
    VerifyResetPassword(
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$VerifyResetPasswordToJson(
  VerifyResetPassword instance,
) => <String, dynamic>{'email': instance.email, 'token': instance.token};
