import 'package:injectable/injectable.dart';

import '../../../api/auth/request/sign_up_request.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/SignUp_reposetries.dart';
import '../data_source/SignUp_Data_Source.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource _remote;

  SignUpRepositoryImpl(this._remote);

  @override
  Future<Result<void>> signUp(SignUpRequest request) async {
    final result = await _remote.signUp(request);

    return result.fold(
      onSuccess: (_) => const Success(null),
      onFailure: (failure) => Failure(failure),
    );
  }
}