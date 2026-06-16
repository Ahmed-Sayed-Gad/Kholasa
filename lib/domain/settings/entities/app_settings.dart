class AppSettings {
  final bool darkMode;
  final bool notificationsEnabled;
  final bool autoSaveEnabled;
  final String language;

  const AppSettings({
    required this.darkMode,
    required this.notificationsEnabled,
    required this.autoSaveEnabled,
    required this.language,
  });

  AppSettings copyWith({
    bool? darkMode,
    bool? notificationsEnabled,
    bool? autoSaveEnabled,
    String? language,
  }) {
    return AppSettings(
      darkMode: darkMode ?? this.darkMode,
      notificationsEnabled:
      notificationsEnabled ??
          this.notificationsEnabled,
      autoSaveEnabled:
      autoSaveEnabled ??
          this.autoSaveEnabled,
      language: language ?? this.language,
    );
  }
}