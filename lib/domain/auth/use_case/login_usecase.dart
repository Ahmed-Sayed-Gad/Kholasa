import 'package:injectable/injectable.dart';

import '../../../api/auth/request/login_request.dart';
import '../../../core/errors/result/results.dart';
import '../entities/user_entity.dart';
import '../repositories/login_repository.dart';

@injectable
class LoginUseCase {
  final LoginRepositories repository;

  LoginUseCase(this.repository);

  Future<Result<UserEntity>> call(
      LoginRequest request,
      ) {
    return repository.login(request);
  }
}