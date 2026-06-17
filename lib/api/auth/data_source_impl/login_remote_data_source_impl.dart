import 'package:injectable/injectable.dart';

import '../../../Data/auth/data_source/login_remote_data_source.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../api_client.dart';
import '../request/login_request.dart';
import '../response/login_response.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl
    implements LoginRemoteDataSource {

  final ApiClient apiClient;
  final AuthErrorHandler errorHandler;

  LoginRemoteDataSourceImpl(
      this.apiClient,
      this.errorHandler,
      );

  @override
  Future<Result<LoginResponse>> login(
      LoginRequest request,
      ) async {
    try {
      final response =
      await apiClient.login(request);

      return Success(response);
    } catch (e) {
      return errorHandler.handleSignInError(
        e as Exception,
      );
    }
  }
}