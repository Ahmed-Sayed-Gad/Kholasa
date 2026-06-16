import 'package:injectable/injectable.dart';

import '../../../api/auth/request/reset_password.dart';
import '../../../core/errors/result/results.dart';
import '../repositories/Reset_password_reposetories.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepositories repository;

  ResetPasswordUseCase(this.repository);

  Future<Result<void>> call(Reset_Password request) {
    return repository.resetPassword(request);
  }
}