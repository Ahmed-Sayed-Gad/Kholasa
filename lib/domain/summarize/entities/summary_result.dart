class SummaryResult {
  final String sessionId;
  final String summary;
  final String filename;
  final String language;
  final bool saved;

  SummaryResult({
    required this.sessionId,
    required this.summary,
    required this.filename,
    required this.language,
    required this.saved,
  });
}