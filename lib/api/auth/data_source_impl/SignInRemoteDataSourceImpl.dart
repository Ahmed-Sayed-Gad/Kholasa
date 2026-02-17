import 'package:injectable/injectable.dart';

import '../../../Data/auth/data_source/SignInRemoteDataSource.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../Api_Client.dart';
import '../request/sign_in_request.dart';
import '../response/sign_in_response.dart';
@Injectable(as: SignInRemoteDataSource)
class Signinremotedatasourceimpl implements SignInRemoteDataSource {
  ApiClient apiClient;
  final AuthErrorHandler errorHandler;
  Signinremotedatasourceimpl(this.apiClient, this.errorHandler);
  @override
  Future<Result<SignInResponse>> signIn(SignInRequest request) async {
    try {
      final response = await apiClient.signIn(request);
      return Success(response);
    } catch (e) {
      return errorHandler.handleSignInError(e as Exception);
    }
  }
}