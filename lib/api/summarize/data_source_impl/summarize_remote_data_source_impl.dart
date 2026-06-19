import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../Data/summarize/data_source/summarize_remote_data_source.dart';
import '../../../api/api_client.dart';
import '../../../core/errors/failures/server_failures.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';

@Injectable(as: SummarizeRemoteDataSource)
class SummarizeRemoteDataSourceImpl
    implements SummarizeRemoteDataSource {

  final ApiClient apiClient;
  final AuthErrorHandler errorHandler;

  SummarizeRemoteDataSourceImpl(
      this.apiClient,
      this.errorHandler,
      );

  @override
  Future<Result<String>> summarize({
    required File file,
    required String language,
    required String format,
    required String length,
    required String sessionId,
  }) async {
    try {
      final multipartFile =
      await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );

      final response =
      await apiClient.summarizeDocument(
        multipartFile,
        language,
        format,
        length,
        sessionId,
      );

      return Success(
        response.data.summary,
      );
    }catch (e, s) {
      print('ERROR: $e');
      print('STACK: $s');

      if (e is Exception) {
        return errorHandler.handle(e);
      }

      rethrow;
    }
  }
}