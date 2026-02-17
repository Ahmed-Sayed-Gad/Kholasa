import '../../models/remember_me_result.dart';

abstract class RememberMeRepository {
  Future<void> save({
    required bool rememberMe,
    required String email,
  });

  Future<RememberMeResult> load();

  Future<void> clear();
}
