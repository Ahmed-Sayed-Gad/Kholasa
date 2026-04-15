import 'package:injectable/injectable.dart';

import '../../auth/repositories/remember_me_repository.dart';
import '../../home/UseCase/remember_me_usecase.dart';
import '../remember_me_result.dart';


@LazySingleton(as: RememberMeUseCase)
class RememberMeUseCaseImpl implements RememberMeUseCase {
  final RememberMeRepository repository;

  RememberMeUseCaseImpl(this.repository);

  @override
  Future<void> saveRememberMe({
    required bool rememberMe,
    required String email,
  }) {
    return repository.save(
      rememberMe: rememberMe,
      email: email,
    );
  }

  @override
  Future<RememberMeResult> loadRememberMe() {
    return repository.load();
  }

  @override
  Future<void> clearRememberMe() {
    return repository.clear();
  }
}
