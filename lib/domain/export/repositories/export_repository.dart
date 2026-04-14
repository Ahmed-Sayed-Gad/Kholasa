import '../../../core/errors/result/results.dart';
import '../models/export_file.dart';
import '../export_type.dart';

abstract class ExportRepository {

  Future<Result<ExportFile>> export({
    required String summary,
    required ExportType type,
    required String fileName,
    required String directoryPath,
  });

}