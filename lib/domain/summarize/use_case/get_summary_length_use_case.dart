

import '../repositories/settings_repository.dart';

class GetSummaryLengthUseCase{
  final SettingsRepository repository;
  GetSummaryLengthUseCase(this.repository);
  Future<String> call()  {
    return  repository.getSummaryLength();
  }




}