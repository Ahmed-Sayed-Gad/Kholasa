import 'package:injectable/injectable.dart';

import '../../../api/auth/request/register_request.dart';
import '../../../core/errors/result/results.dart';

import '../../../domain/auth/repositories/register_repositories.dart';
import '../data_source/register_Data_Source.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl
    implements RegisterRepository {
  final RegisterDataSource _remote;

  RegisterRepositoryImpl(this._remote);

  @override
  Future<Result<void>> register(
      RegisterRequest request,
      ) async {
    final result =
    await _remote.register(request);

    return result.fold(
      onSuccess: (_) => const Success(null),
      onFailure: (failure) =>
          Failure(failure),
    );
  }
}