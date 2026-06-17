
import '../../../api/auth/request/login_request.dart';
import '../../../api/auth/response/login_response.dart';
import '../../../core/errors/result/results.dart';

abstract class LoginRemoteDataSource {
  Future<Result<LoginResponse>> login(LoginRequest request);
}