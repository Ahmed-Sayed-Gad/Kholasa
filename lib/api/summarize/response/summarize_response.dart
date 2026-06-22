import 'package:json_annotation/json_annotation.dart';

part 'summarize_response.g.dart';

@JsonSerializable()
class SummarizeResponse {

  final String date;
  final String filename;
  final String format;
  final String id;
  final String language;
  final String summary;
  final bool saved;

  SummarizeResponse({
    required this.date,
    required this.filename,
    required this.format,
    required this.id,
    required this.language,
    required this.summary,
    required this.saved,
  });

  factory SummarizeResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$SummarizeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SummarizeResponseToJson(this);
}