

import '../../../api/auth/request/verify_reset_password.dart';
import '../../../core/errors/result/results.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<Result<void>> verifyResetCode(VerifyResetPassword request);
}