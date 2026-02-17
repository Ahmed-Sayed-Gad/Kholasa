


import '../../../api/auth/request/SignUpRequest.dart';
import '../../../core/errors/result/results.dart';

abstract class SignUpDataSource{
  Future<Result<void>> signUp(SignUpRequest request);
}