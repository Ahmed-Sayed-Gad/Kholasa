import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../../../domain/export/export_type.dart';
import '../../../domain/export/use_case/export_summary_use_case.dart';
import '../../../domain/export/models/export_file.dart';
import 'export_state.dart';

@injectable
class ExportCubit extends Cubit<ExportState> {

  final ExportSummaryUseCase exportSummaryUseCase;

  ExportCubit(this.exportSummaryUseCase) : super(ExportInitial());

  Future<void> exportSummary({
    required String summary,
    required ExportType type,
    required String fileName,
    required String directory,
  }) async {

    emit(ExportLoading());

    final result = await exportSummaryUseCase(
      summary: summary,
      type: type,
      fileName: fileName,
      directoryPath: directory,
    );

    result.fold(

      onSuccess: (file) {
        emit(ExportSuccess(file));
      },

      onFailure: (failure) {
        emit(ExportError(failure.userFriendlyMessage));
      },

    );
  }
}