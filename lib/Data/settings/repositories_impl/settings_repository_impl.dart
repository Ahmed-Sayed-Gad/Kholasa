import 'package:injectable/injectable.dart';

import '../../../domain/settings/entities/app_settings.dart';
import '../../../domain/settings/repositories/settings_repository.dart';

import '../data_source/settings_local_data_source.dart';
import '../models/settings_model.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl(this.localDataSource);

  @override
  Future<AppSettings> getSettings() async {
    return await localDataSource.getSettings();
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    final model = SettingsModel.fromEntity(settings);

    await localDataSource.saveSettings(model);
  }
}
