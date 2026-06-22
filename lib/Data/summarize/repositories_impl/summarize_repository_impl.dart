import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domain/summarize/entities/summary_result.dart';
import '../../../domain/summarize/repositories/summarize_repository.dart';
import '../data_source/summarize_remote_data_source.dart';

@LazySingleton(as: SummarizeRepository)
class SummarizeRepositoryImpl
    implements SummarizeRepository {
  final SummarizeRemoteDataSource remoteDataSource;
  SummarizeRepositoryImpl(
      this.remoteDataSource,
      );

  @override
  Future<SummaryResult> generateSummary({
    required File file,
    required String length,
    required String language,
    required List<String> focusAreas,
  })async {

    String apiLength;

    switch (length) {
      case 'short':
        apiLength = '1';
        break;

      case 'medium':
        apiLength = '2';
        break;

      case 'long':
        apiLength = '3';
        break;

      default:
        apiLength = '2';
    }

    final result = await remoteDataSource.summarize(
      file: file,
      language: language,
      format: 'text',
      length: length,
      sessionId: 'default',
    );

    return result.fold(
      onSuccess: (summary) {
        return SummaryResult(
          summary: summary,
        );
      },
      onFailure: (failure) {
        throw Exception(
          failure.userFriendlyMessage,
        );
      },
    );
  }
  }
