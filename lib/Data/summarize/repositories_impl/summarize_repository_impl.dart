import 'dart:io';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures/server_failures.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/upload/entities/upload_file.dart';
import '../../../domain/summarize/entities/summary_result.dart';
import '../../../domain/summarize/repositories/summarize_repository.dart';
import '../data_source/summarize_fake_data_source.dart';

@LazySingleton(as: SummarizeRepository)
class SummarizeRepositoryImpl implements SummarizeRepository {
  final SummarizeFakeDataSource dataSource;

  SummarizeRepositoryImpl(this.dataSource);

  @override
  Future<Result<SummaryResult>> summarize(UploadFile file) async {
    try {
      final ioFile = File(file.path); // 👈 التحويل هنا فقط
      final result = await dataSource.summarize(ioFile);
      return Success(result);
    } catch (_) {
      return Failure(UnknownFailure.general());
    }
  }
}
