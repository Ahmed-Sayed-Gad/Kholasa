import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../entities/user_entity.dart';
import '../repositories/sign_in_repository.dart';
import '../../../api/auth/request/sign_in_request.dart';

@injectable
class SignInUseCase {
  final SignInRepositories repository;

  SignInUseCase(this.repository);

  Future<Result<UserEntity>> call(SignInRequest request) {
    return repository.signIn(request);
  }
}