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
      print("FILE => ${file.path}");
      print("LANGUAGE => $language");
      print("FORMAT => $format");
      print("LENGTH => $length");
      print("SESSION => $sessionId");
      final dio = Dio();

      final formData = FormData.fromMap({
        "file": multipartFile,
        "language": language,
        "format": format,
        "length": length,
        "session_id": sessionId,
      });

      final response = await apiClient.summarizeDocument(
        multipartFile,
        language,
        format,
        length,
        sessionId,
      );

      return Success(
        response.summary,
      );

    }catch (e, s) {

      if (e is DioException) {
        print("STATUS => ${e.response?.statusCode}");
        print("DATA => ${e.response?.data}");
      }

      print(e);
      print(s);

      if (e is Exception) {
        return errorHandler.handle(e);
      }

      rethrow;
    }
  }
}