import 'package:json_annotation/json_annotation.dart';

part 'summarize_response.g.dart';

@JsonSerializable()
class SummarizeResponse {
  final bool success;
  final String? message;
  final SummarizeData data;

  SummarizeResponse({
    required this.success,
    this.message,
    required this.data,
  });

  factory SummarizeResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$SummarizeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SummarizeResponseToJson(this);
}

@JsonSerializable()
class SummarizeData {
  final String summary;

  SummarizeData({
    required this.summary,
  });

  factory SummarizeData.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$SummarizeDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SummarizeDataToJson(this);
}