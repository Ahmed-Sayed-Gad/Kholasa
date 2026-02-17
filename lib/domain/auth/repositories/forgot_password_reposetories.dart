
import '../../../api/auth/request/Forgot_Password_Request.dart';
import '../../../core/errors/result/results.dart';


abstract class ForgotPasswordReposetories {
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request);
}