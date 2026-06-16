import 'package:injectable/injectable.dart';


import '../../../Data/auth/data_source/verifyResetCodeDataSource.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../api_client.dart';
import '../request/verify_reset_password.dart';
@Injectable(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImpl implements VerifyResetCodeRemoteDataSource {
  ApiClient apiClient;
   AuthErrorHandler errorHandler;
  VerifyResetCodeRemoteDataSourceImpl(this.apiClient, this.errorHandler);
  @override
  Future<Result<void>> verifyResetCode(VerifyResetPassword request) async {
    try {
     final response =  await apiClient.verifyResetCode(request);
      return  Success(response);
    } catch (e) {
      return errorHandler.handleVerifyCodeError(e as Exception);
    }
  }
}