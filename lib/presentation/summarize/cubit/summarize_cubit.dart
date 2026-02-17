import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/summarize/entities/summary_result.dart';
import 'summarize_state.dart';

@injectable
class SummarizeCubit extends Cubit<SummarizeState> {
  SummarizeCubit() : super(const SummarizeInitial());

  // تغيير طول الملخص
  void changeLength(SummaryLength length) {
    emit(
      state.copyWith(length: length),
    );
  }

  // اختيار / إزالة Focus Area
  void toggleFocusArea(String area) {
    final updated = Set<String>.from(state.focusAreas);

    if (updated.contains(area)) {
      updated.remove(area);
    } else {
      updated.add(area);
    }

    emit(
      state.copyWith(focusAreas: updated),
    );
  }

  // Generate Summary
  Future<void> generateSummary() async {
    emit(
      SummarizeLoading(
        length: state.length,
        focusAreas: state.focusAreas,
      ),
    );

    await Future.delayed(const Duration(seconds: 2));

    emit(
      SummarizeSuccess(
        result: SummaryResult(
          summary: 'This is a fake AI summary.',
          pages: 3,
          language: 'en',
        ),
        length: state.length,
        focusAreas: state.focusAreas,
      ),
    );
  }
}
