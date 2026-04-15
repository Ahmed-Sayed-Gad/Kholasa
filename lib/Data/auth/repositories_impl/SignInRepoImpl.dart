import 'package:injectable/injectable.dart';

import '../../../api/auth/request/sign_in_request.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/entities/user_entity.dart';
import '../../../domain/auth/repositories/sign_in_repository.dart';
import '../data_source/SignInRemoteDataSource.dart';

@Injectable(as: SignInRepositories)
class SignInRepoImpl implements SignInRepositories {
  final SignInRemoteDataSource _remote;

  SignInRepoImpl(this._remote);

  @override
  Future<Result<UserEntity>> signIn(SignInRequest request) async {
    final result = await _remote.signIn(request);

    return result.fold(
      onSuccess: (response) {
        final user = response.user;

        return Success(
          UserEntity(
            id: user?.Id ?? '',
            username: user?.username ?? '',
            email: user?.email ?? '',
            token: response.token ?? '',
          ),
        );
      },
      onFailure: (failure) => Failure(failure),
    );
  }
}