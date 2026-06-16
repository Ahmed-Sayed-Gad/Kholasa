import '../../../domain/settings/entities/app_settings.dart';

enum SettingsStatus { initial, loading, loaded, error }

class SettingsState {
  final SettingsStatus status;
  final AppSettings settings;
  final String? message;

  const SettingsState({
    required this.status,
    required this.settings,
    this.message,
  });

  factory SettingsState.initial() {
    return const SettingsState(
      status: SettingsStatus.initial,
      settings: AppSettings(
        darkMode: true,
        notificationsEnabled: true,
        autoSaveEnabled: true,
        language: 'en',
      ),
    );
  }

  SettingsState copyWith({
    SettingsStatus? status,
    AppSettings? settings,
    String? message,
  }) {
    return SettingsState(
      status: status ?? this.status,
      settings: settings ?? this.settings,
      message: message,
    );
  }
}
