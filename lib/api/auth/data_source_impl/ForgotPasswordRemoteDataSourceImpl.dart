import 'package:injectable/injectable.dart';


import '../../../Data/auth/data_source/ForgotPasswordRemoteDataSource.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../Api_Client.dart';
import '../request/Forgot_Password_Request.dart';
@Injectable(as: ForgotPasswordRemoteDataSource)
class ForgotPasswordRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource {
  ApiClient apiClient;
   AuthErrorHandler errorHandler;
  ForgotPasswordRemoteDataSourceImpl(this.apiClient, this.errorHandler);
  @override
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request) async{
   try {
    final response =  await apiClient.forgotPassword(request);
      return Success(response);
    } catch (e) {
      return errorHandler.handleForgotPasswordError(e as Exception);
    }
  }
}