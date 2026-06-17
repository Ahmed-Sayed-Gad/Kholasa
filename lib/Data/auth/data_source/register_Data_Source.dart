


import '../../../api/auth/request/register_request.dart';
import '../../../core/errors/result/results.dart';

abstract class RegisterDataSource{
  Future<Result<void>> register(RegisterRequest request);
}