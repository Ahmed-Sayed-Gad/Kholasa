

import '../repositories/settings_repository.dart';

class SaveSummaryLengthUseCase{
  final SettingsRepository repository;
  SaveSummaryLengthUseCase(this.repository);
  Future<void> call(String length)  {
    return  repository.saveSummaryLength(length);
  }




}