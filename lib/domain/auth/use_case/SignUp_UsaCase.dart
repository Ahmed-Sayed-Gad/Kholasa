import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../repositories/SignUp_reposetries.dart';
import '../../../api/auth/request/SignUpRequest.dart';

@injectable
class SignUpUseCase {
  final SignUpRepository repository;

  SignUpUseCase(this.repository);

  Future<Result<void>> call(SignUpRequest request) {
    return repository.signUp(request);
  }
}