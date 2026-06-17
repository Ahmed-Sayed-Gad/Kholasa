import '../../../api/auth/request/login_request.dart';
import '../../../core/errors/result/results.dart';
import '../entities/user_entity.dart';

abstract class LoginRepositories {
  Future<Result<UserEntity>> login(LoginRequest request);
}