
import '../../../api/auth/request/SignUpRequest.dart';
import '../../../core/errors/result/results.dart';

abstract class SignUp_Rpo{
  Future<Result<void>> signUp(SignUpRequest request);
}