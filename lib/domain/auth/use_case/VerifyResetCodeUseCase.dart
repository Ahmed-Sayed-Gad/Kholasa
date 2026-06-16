import 'package:injectable/injectable.dart';

import '../../../api/auth/request/verify_reset_password.dart';
import '../../../core/errors/result/results.dart';
import '../repositories/verify_reset_code.dart';

@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeRepositories repository;

  VerifyResetCodeUseCase(this.repository);

  Future<Result<void>> call(VerifyResetPassword request) {
    return repository.verifyResetCode(request);
  }
}