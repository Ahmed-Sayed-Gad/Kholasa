import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/services/notification_manager.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/export/export_type.dart';
import '../../../domain/export/use_case/export_summary_use_case.dart';
import '../../../domain/export/models/export_file.dart';
import 'export_state.dart';

@injectable
class ExportCubit extends Cubit<ExportState> {
  final ExportSummaryUseCase exportSummaryUseCase;
  final NotificationManager notificationManager;

  ExportCubit(
    this.exportSummaryUseCase,
    this.notificationManager,
  ) : super(ExportInitial());

  Future<void> exportSummary({
    required String summary,
    required ExportType type,
    required String fileName,
  }) async {
    emit(ExportLoading());

    final result = await exportSummaryUseCase(
      summary: summary,
      type: type,
      fileName: fileName,
    );

    result.fold(
      onSuccess: (file) {
        if (type == ExportType.pdf) {
          notificationManager.pdfExported(fileName);
        } else {
          notificationManager.txtExported(fileName);
        }
        emit(ExportSuccess(file));
      },
      onFailure: (failure) {
        emit(ExportError(failure.userFriendlyMessage));
      },
    );
  }
}