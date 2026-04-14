import '../../../core/errors/result/results.dart';
import '../models/export_file.dart';
import '../repositories/export_repository.dart';
import '../export_type.dart';

class ExportSummaryUseCase {

  final ExportRepository repository;

  ExportSummaryUseCase(this.repository);

  Future<Result<ExportFile>> call({
    required String summary,
    required ExportType type,
    required String fileName,
    required String directoryPath,
  }) {

    return repository.export(
      summary: summary,
      type: type,
      fileName: fileName,
      directoryPath: directoryPath,
    );

  }

}