import 'dart:io';

enum SummaryLength { short, medium, long }

abstract class SummarizeState {
  final File file;
  final SummaryLength length;
  final List<String> focusAreas;

  const SummarizeState({
    required this.file,
    required this.length,
    required this.focusAreas,
  });
}

class SummarizeInitial extends SummarizeState {
  const SummarizeInitial({
    required super.file,
    super.length = SummaryLength.medium,
    super.focusAreas = const [],
  });

  SummarizeInitial copyWith({
    File? file,
    SummaryLength? length,
    List<String>? focusAreas,
  }) {
    return SummarizeInitial(
      file: file ?? this.file,
      length: length ?? this.length,
      focusAreas: focusAreas ?? this.focusAreas,
    );
  }
}

class SummarizeLoading extends SummarizeState {
  const SummarizeLoading({
    required super.file,
    required super.length,
    required super.focusAreas,
  });

  factory SummarizeLoading.from(SummarizeState state) {
    return SummarizeLoading(
      file: state.file,
      length: state.length,
      focusAreas: state.focusAreas,
    );
  }
}

class SummarizeSuccess extends SummarizeState {
  final String summary;

  const SummarizeSuccess({
    required this.summary,
    required super.file,
    required super.length,
    required super.focusAreas,
  });

  factory SummarizeSuccess.from(SummarizeState state, String summary) {
    return SummarizeSuccess(
      summary: summary,
      file: state.file,
      length: state.length,
      focusAreas: state.focusAreas,
    );
  }
}

class SummarizeError extends SummarizeState {
  final String message;

  const SummarizeError({
    required this.message,
    required super.file,
    required super.length,
    required super.focusAreas,
  });

  factory SummarizeError.from(SummarizeState state, String message) {
    return SummarizeError(
      message: message,
      file: state.file,
      length: state.length,
      focusAreas: state.focusAreas,
    );
  }
}
