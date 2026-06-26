import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domain/scan/repositories/scan_repository.dart';
import '../../summarize/data_source/summarize_remote_data_source.dart';

@LazySingleton(as: ScanRepository)
class ScanRepositoryImpl implements ScanRepository {
  final SummarizeRemoteDataSource remoteDataSource;

  ScanRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<String>> extractText(File image) async {
    final result = await remoteDataSource.summarize(
      file: image,
      language: 'en',
      format: 'text',
      length: 'medium',
      sessionId: 'default',
    );

    return result.fold(
      onSuccess: (response) => Success(response.summary),
      onFailure: (failure) => throw Exception(
        failure.userFriendlyMessage,
      ),
    );
  }
}
