import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/summarize/repositories/settings_repository.dart';

class SettingsRepositoryImpl {
  static const _key = 'summary_length';

  @override
  Future<void> saveSummaryLength(String length) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, length);
  }

  @override
  Future<String> getSummaryLength() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? 'medium';
  }
}
