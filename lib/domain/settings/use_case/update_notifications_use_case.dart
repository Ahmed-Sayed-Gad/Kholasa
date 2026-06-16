import 'package:injectable/injectable.dart';

import '../repositories/settings_repository.dart';

@injectable

class UpdateNotificationsUseCase {
  final SettingsRepository repository;

  UpdateNotificationsUseCase(this.repository);

  Future<void> call(bool enabled) async {
    final current = await repository.getSettings();

    final updated = current.copyWith(notificationsEnabled: enabled);

    await repository.saveSettings(updated);
  }
}
