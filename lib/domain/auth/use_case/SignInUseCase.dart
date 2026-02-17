import 'package:injectable/injectable.dart';

import '../../../api/auth/request/sign_in_request.dart';
import '../../../api/auth/response/sign_in_response.dart';
import '../../../core/errors/result/results.dart';
import '../repositories/sign_in_reposetories.dart';
@injectable
class SignInUseCase {
  final SignInRepositories _signInRepositories;
  SignInUseCase(this._signInRepositories);
  Future<Result<SignInResponse>> signIn(SignInRequest request)  {
    return _signInRepositories.signIn(request);
  }
}