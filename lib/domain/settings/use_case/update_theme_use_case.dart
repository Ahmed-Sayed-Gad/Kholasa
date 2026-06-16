import 'package:injectable/injectable.dart';

import '../repositories/settings_repository.dart';
@injectable

class UpdateThemeUseCase {
  final SettingsRepository repository;

  UpdateThemeUseCase(this.repository);

  Future<void> call(bool isDark) async {
    final current = await repository.getSettings();

    final updated = current.copyWith(darkMode: isDark);

    await repository.saveSettings(updated);
  }
}
