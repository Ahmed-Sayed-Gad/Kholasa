import 'package:injectable/injectable.dart';

import '../../../Data/auth/data_source/ResetPasswordRemoteDataSource.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../api_client.dart';
import '../request/reset_password.dart';
@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  ApiClient apiClient;
  final AuthErrorHandler errorHandler;
  ResetPasswordRemoteDataSourceImpl(this.apiClient, this.errorHandler);
  @override
  Future<Result<void>> resetPassword(Reset_Password request) async {
    try {
     final response = await apiClient.resetPassword(request);
      return  Success(response);
    } catch (e) {
      return errorHandler.handleResetPasswordError(e as Exception);
    }
  }
}