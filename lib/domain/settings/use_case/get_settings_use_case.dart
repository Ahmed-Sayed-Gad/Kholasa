import 'package:injectable/injectable.dart';
import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';

@injectable
class GetSettingsUseCase {
  final SettingsRepository repository;

  GetSettingsUseCase(this.repository);

  Future<AppSettings> call() {
    return repository.getSettings();
  }
}