import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveUser({
    required String name,
    required String email,
  }) async {
    await _storage.write(key: "name", value: name);
    await _storage.write(key: "email", value: email);
  }

  static Future<String?> getName() async {
    return await _storage.read(key: "name");
  }

  static Future<String?> getEmail() async {
    return await _storage.read(key: "email");
  }

  static Future<void> saveProfilePhotoPath(String path) async {
    await _storage.write(key: "profile_photo_path", value: path);
  }

  static Future<String?> getProfilePhotoPath() async {
    return await _storage.read(key: "profile_photo_path");
  }

  static Future<void> clear() async {
    await _storage.delete(key: "name");
    await _storage.delete(key: "email");
    await _storage.delete(key: "profile_photo_path");
  }
}