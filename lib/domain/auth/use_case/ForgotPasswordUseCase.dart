import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../repositories/forgot_password_reposetories.dart';
import '../../../api/auth/request/forgot_password_request.dart';

@injectable
class ForgotPasswordUseCase {
  final ForgotPasswordRepositories repository;

  ForgotPasswordUseCase(this.repository);

  Future<Result<void>> call(ForgotPasswordRequest request) {
    return repository.forgotPasswordSendCode(request);
  }
}