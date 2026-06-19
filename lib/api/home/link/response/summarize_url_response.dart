import 'package:json_annotation/json_annotation.dart';

part 'summarize_url_response.g.dart';

@JsonSerializable()
class SummarizeUrlResponse {
  final bool success;
  final String? message;
  final SummaryData data;
  final dynamic error;

  SummarizeUrlResponse({
    required this.success,
    this.message,
    required this.data,
    this.error,
  });

  factory SummarizeUrlResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$SummarizeUrlResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SummarizeUrlResponseToJson(this);
}

@JsonSerializable()
class SummaryData {
  final String summary;

  SummaryData({
    required this.summary,
  });

  factory SummaryData.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$SummaryDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SummaryDataToJson(this);
}