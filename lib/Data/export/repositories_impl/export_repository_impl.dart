import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/errors/failures/server_failures.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/export/export_type.dart';
import '../../../domain/export/models/export_file.dart';
import '../../../domain/export/repositories/export_repository.dart';

class ExportRepositoryImpl implements ExportRepository {
  @override
  Future<Result<ExportFile>> export({
    required String summary,
    required ExportType type,
    required String fileName,
  }) async {
    try {
      final dir = await getApplicationDocumentsDirectory();

      switch (type) {
        case ExportType.txt:
          final file = File('${dir.path}/$fileName.txt');

          await file.writeAsString(summary);

          return Success(
            ExportFile(
              path: file.path,
              name: '$fileName.txt',
            ),
          );

        case ExportType.pdf:
          final pdf = pw.Document();

          pdf.addPage(
            pw.Page(
              build: (_) => pw.Text(summary),
            ),
          );

          final file = File('${dir.path}/$fileName.pdf');

          await file.writeAsBytes(await pdf.save());

          return Success(
            ExportFile(
              path: file.path,
              name: '$fileName.pdf',
            ),
          );
      }
    } catch (e) {
      print("EXPORT ERROR => $e");

      return Failure(
        ServerFailure(
          message: e.toString(),
          userFriendlyMessage: e.toString(),
        ),
      );
    }
  }
}