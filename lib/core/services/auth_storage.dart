import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static const FlutterSecureStorage _storage =
  FlutterSecureStorage();

  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(
      key: 'accessToken',
      value: accessToken,
    );

    await _storage.write(
      key: 'refreshToken',
      value: refreshToken,
    );
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(
      key: 'accessToken',
    );
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(
      key: 'refreshToken',
    );
  }

  static Future<void> logout() async {
    await _storage.deleteAll();
  }
}