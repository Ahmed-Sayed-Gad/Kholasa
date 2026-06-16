import 'package:injectable/injectable.dart';

import '../repositories/settings_repository.dart';
@injectable

class UpdateAutoSaveUseCase {
  final SettingsRepository repository;

  UpdateAutoSaveUseCase(this.repository);

  Future<void> call(bool enabled) async {
    final current = await repository.getSettings();

    final updated = current.copyWith(autoSaveEnabled: enabled);

    await repository.saveSettings(updated);
  }
}
