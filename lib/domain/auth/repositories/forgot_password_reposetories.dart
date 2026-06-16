import '../../../api/auth/request/forgot_password_request.dart';
import '../../../core/errors/result/results.dart';

abstract class ForgotPasswordRepositories {
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request);
}