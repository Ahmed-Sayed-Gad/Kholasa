import 'package:injectable/injectable.dart';

import '../../../api/auth/request/register_request.dart';
import '../../../core/errors/result/results.dart';
import '../repositories/register_repositories.dart';

@injectable
class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<Result<void>> call(
      RegisterRequest request,
      ) {
    return repository.register(request);
  }
}