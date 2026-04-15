
import '../../models/remember_me_result.dart';

abstract class RememberMeUseCase {
  Future<void> saveRememberMe({
    required bool rememberMe,
    required String email,
  });

  Future<RememberMeResult> loadRememberMe();

  Future<void> clearRememberMe();
}
