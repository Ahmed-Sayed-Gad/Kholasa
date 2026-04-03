import '../../../api/auth/request/sign_in_request.dart';
import '../../../core/errors/result/results.dart';
import '../entities/user_entity.dart';

abstract class SignInRepositories {
  Future<Result<UserEntity>> signIn(SignInRequest request);
}