import '../../../domain/summarize/entities/summary_result.dart';

enum SummaryLength { short, medium, long }

sealed class SummarizeState {
  final SummaryLength length;
  final Set<String> focusAreas;

  const SummarizeState({
    required this.length,
    required this.focusAreas,
  });

  // ⭐ الحل هنا
  SummarizeState copyWith({
    SummaryLength? length,
    Set<String>? focusAreas,
  }) {
    return SummarizeInitial(
      length: length ?? this.length,
      focusAreas: focusAreas ?? this.focusAreas,
    );
  }
}

class SummarizeInitial extends SummarizeState {
  const SummarizeInitial({
    SummaryLength length = SummaryLength.medium,
    Set<String> focusAreas = const {},
  }) : super(length: length, focusAreas: focusAreas);
}

class SummarizeLoading extends SummarizeState {
  const SummarizeLoading({
    required super.length,
    required super.focusAreas,
  });
}

class SummarizeSuccess extends SummarizeState {
  final SummaryResult result;

  const SummarizeSuccess({
    required this.result,
    required super.length,
    required super.focusAreas,
  });
}

class SummarizeError extends SummarizeState {
  final String message;

  const SummarizeError({
    required this.message,
    required super.length,
    required super.focusAreas,
  });
}
