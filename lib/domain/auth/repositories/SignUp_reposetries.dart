import '../../../api/auth/request/sign_up_request.dart';
import '../../../core/errors/result/results.dart';

abstract class SignUpRepository {
  Future<Result<void>> signUp(SignUpRequest request);
}