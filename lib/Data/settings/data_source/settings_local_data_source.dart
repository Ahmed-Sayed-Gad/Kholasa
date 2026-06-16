import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<SettingsModel> getSettings();

  Future<void> saveSettings(SettingsModel model);
}

@LazySingleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  static const key = 'app_settings';

  final SharedPreferences prefs;

  SettingsLocalDataSourceImpl(this.prefs);

  @override
  Future<SettingsModel> getSettings() async {
    final jsonString = prefs.getString(key);

    if (jsonString == null) {
      return const SettingsModel(
        darkMode: true,
        notificationsEnabled: true,
        autoSaveEnabled: true,
        language: 'en',
      );
    }

    final map = jsonDecode(jsonString);

    return SettingsModel.fromJson(map);
  }

  @override
  Future<void> saveSettings(SettingsModel model) async {
    final jsonString = jsonEncode(model.toJson());

    await prefs.setString(key, jsonString);
  }
}
