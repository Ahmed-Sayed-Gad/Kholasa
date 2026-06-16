import '../../../domain/settings/entities/app_settings.dart';

class SettingsModel extends AppSettings {
  const SettingsModel({
    required super.darkMode,
    required super.notificationsEnabled,
    required super.autoSaveEnabled,
    required super.language,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      darkMode: json['darkMode'] ?? true,
      notificationsEnabled: json['notificationsEnabled'] ?? true,
      autoSaveEnabled: json['autoSaveEnabled'] ?? true,
      language: json['language'] ?? 'en',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'darkMode': darkMode,
      'notificationsEnabled': notificationsEnabled,
      'autoSaveEnabled': autoSaveEnabled,
      'language': language,
    };
  }

  factory SettingsModel.fromEntity(AppSettings entity) {
    return SettingsModel(
      darkMode: entity.darkMode,
      notificationsEnabled: entity.notificationsEnabled,
      autoSaveEnabled: entity.autoSaveEnabled,
      language: entity.language,
    );
  }
}
