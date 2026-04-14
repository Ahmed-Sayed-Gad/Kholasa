import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../repositories/verify_reset_code.dart';
import '../../../api/auth/request/Verify_Reset_password.dart';

@injectable
class VerifyResetCodeUseCase {
  final VerifyResetCodeRepositories repository;

  VerifyResetCodeUseCase(this.repository);

  Future<Result<void>> call(Verify_reset_password request) {
    return repository.verifyResetCode(request);
  }
}