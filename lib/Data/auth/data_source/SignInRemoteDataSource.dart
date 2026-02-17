
import '../../../api/auth/request/sign_in_request.dart';
import '../../../api/auth/response/sign_in_response.dart';
import '../../../core/errors/result/results.dart';

abstract class SignInRemoteDataSource {
  Future<Result<SignInResponse>> signIn(SignInRequest request);
}