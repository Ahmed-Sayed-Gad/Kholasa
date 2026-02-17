

import '../../../api/auth/request/Verify_Reset_password.dart';
import '../../../core/errors/result/results.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<Result<void>> verifyResetCode(Verify_reset_password request);
}