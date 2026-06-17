import 'package:injectable/injectable.dart';

import '../../../api/auth/request/login_request.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/entities/user_entity.dart';
import '../../../domain/auth/repositories/login_repository.dart';
import '../data_source/login_remote_data_source.dart';

@Injectable(as: LoginRepositories)
class LoginRepoImpl
    implements LoginRepositories {

  final LoginRemoteDataSource _remote;

  LoginRepoImpl(this._remote);

  @override
  Future<Result<UserEntity>> login(
      LoginRequest request,
      ) async {
    final result =
    await _remote.login(request);

    return result.fold(
      onSuccess: (response) {
        return Success(
          UserEntity(
            accessToken: response.data.accessToken,
            refreshToken: response.data.refreshToken,
            expiresIn: response.data.expiresIn,
            name: response.data.name,
            email: response.data.email,
            role: response.data.role,
          ),
        );
      },
      onFailure: (failure) =>
          Failure(failure),
    );
  }
}