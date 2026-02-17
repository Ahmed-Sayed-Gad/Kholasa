import 'package:injectable/injectable.dart';
import '../../../api/auth/request/SignUpRequest.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/SignUp_reposetries.dart';
import '../data_source/SignUp_Data_Source.dart';
/// unit testing
@Injectable(as:SignUp_Rpo)
class SignUp_Repo_Imp implements SignUp_Rpo{
  final SignUpDataSource _signUpDataSource;
  SignUp_Repo_Imp(this._signUpDataSource);
  @override
  Future<Result<void>> signUp(SignUpRequest request) {
    return _signUpDataSource.signUp(request);
  }
}