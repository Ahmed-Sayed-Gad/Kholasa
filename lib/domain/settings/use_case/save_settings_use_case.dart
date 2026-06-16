import 'package:injectable/injectable.dart';

import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';
@injectable

class SaveSettingsUseCase {
  final SettingsRepository repository;

  SaveSettingsUseCase(this.repository);

  Future<void> call(AppSettings settings) {
    return repository.saveSettings(settings);
  }
}
