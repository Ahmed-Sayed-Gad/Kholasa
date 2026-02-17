import 'package:injectable/injectable.dart';


import '../../../api/auth/request/sign_in_request.dart';
import '../../../api/auth/response/sign_in_response.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/sign_in_reposetories.dart';
import '../data_source/SignInRemoteDataSource.dart';
@Injectable(as: SignInRepositories)
class SignInRepoImpl  implements SignInRepositories{

  final SignInRemoteDataSource _signInRemoteDataSource;
  SignInRepoImpl(this._signInRemoteDataSource);
  @override
  Future<Result<SignInResponse>> signIn(SignInRequest request) async {
    return _signInRemoteDataSource.signIn(request);
  }
}