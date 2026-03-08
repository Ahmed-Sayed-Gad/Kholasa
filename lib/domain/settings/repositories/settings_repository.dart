abstract class SettingsRepository {
  Future<void> saveSummaryLength(String length);
  Future<String> getSummaryLength();
}