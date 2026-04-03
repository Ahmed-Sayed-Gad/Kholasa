import 'dart:io';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures/server_failures.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/summarize/repositories/summarize_repository.dart';
import '../../../domain/summarize/entities/summary_result.dart';
import '../data_source/summarize_fake_data_source.dart';

@LazySingleton(as: SummarizeRepository)
class SummarizeRepositoryImpl implements SummarizeRepository {

  final SummarizeFakeDataSource dataSource;

  SummarizeRepositoryImpl(this.dataSource);

  @override
  Future<Result<String>> summarize(File file) async {
    try {
      final result = await dataSource.summarize(file);
      return Success(result);
    } catch (_) {
      return Failure(UnknownFailure.general());
    }
  }

  @override
  Future<SummaryResult> generateSummary({required File file, required String length, required List<String> focusAreas}) {
    // TODO: implement generateSummary
    throw UnimplementedError();
  }


}