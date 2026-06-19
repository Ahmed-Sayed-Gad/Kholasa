// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reset_Password _$Reset_PasswordFromJson(Map<String, dynamic> json) =>
    Reset_Password(
      email: json['email'] as String,
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$Reset_PasswordToJson(Reset_Password instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'newPassword': instance.newPassword,
    };
