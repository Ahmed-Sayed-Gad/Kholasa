import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/repositories/remember_me_repository.dart';
import '../../../domain/models/remember_me_result.dart';


@LazySingleton(as: RememberMeRepository)
class RememberMeRepositoryImpl implements RememberMeRepository {
  final FlutterSecureStorage storage;

  RememberMeRepositoryImpl(this.storage);

  static const _rememberKey = 'remember_me';
  static const _emailKey = 'remembered_email';

  @override
  Future<void> save({
    required bool rememberMe,
    required String email,
  }) async {
    if (rememberMe) {
      await storage.write(key: _rememberKey, value: 'true');
      await storage.write(key: _emailKey, value: email);
    } else {
      await clear();
    }
  }

  @override
  Future<RememberMeResult> load() async {
    final remember = await storage.read(key: _rememberKey);
    final email = await storage.read(key: _emailKey);

    return RememberMeResult(
      rememberMe: remember == 'true',
      email: email,
    );
  }

  @override
  Future<void> clear() async {
    await storage.delete(key: _rememberKey);
    await storage.delete(key: _emailKey);
  }
}
