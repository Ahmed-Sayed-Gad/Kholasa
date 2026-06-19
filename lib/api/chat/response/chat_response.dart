import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  final bool success;
  final String? message;
  final ChatData data;
  final dynamic error;

  ChatResponse({
    required this.success,
    this.message,
    required this.data,
    this.error,
  });

  factory ChatResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ChatResponseToJson(this);
}

@JsonSerializable()
class ChatData {
  final String response;

  ChatData({
    required this.response,
  });

  factory ChatData.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ChatDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ChatDataToJson(this);
}