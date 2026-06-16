import 'package:injectable/injectable.dart';

import '../repositories/settings_repository.dart';
@injectable

class UpdateLanguageUseCase {
  final SettingsRepository repository;

  UpdateLanguageUseCase(this.repository);

  Future<void> call(String language) async {
    final current = await repository.getSettings();

    final updated = current.copyWith(language: language);

    await repository.saveSettings(updated);
  }
}
