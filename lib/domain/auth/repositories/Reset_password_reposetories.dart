import '../../../api/auth/request/Reset Password.dart';
import '../../../core/errors/result/results.dart';

abstract class ResetPasswordRepositories {
  Future<Result<void>> resetPassword(Reset_Password request);
}