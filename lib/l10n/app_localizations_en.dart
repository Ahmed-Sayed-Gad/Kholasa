// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get managePreferences => 'Manage your preferences';

  @override
  String get account => 'ACCOUNT';

  @override
  String get preferences => 'PREFERENCES';

  @override
  String get languagePreference => 'Language Preference';

  @override
  String get autoSave => 'Auto-save Summaries';

  @override
  String get autoSaveDesc => 'Automatically save all summaries';

  @override
  String get notifications => 'Push Notifications';

  @override
  String get notificationsDesc => 'Get notified when summaries are ready';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get darkModeDesc => 'Use dark theme';

  @override
  String get subscription => 'SUBSCRIPTION';

  @override
  String get subscriptionBilling => 'Subscription & Billing';

  @override
  String get freePlan => 'Free Plan';

  @override
  String get privacySecurity => 'PRIVACY & SECURITY';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get terms => 'Terms of Service';

  @override
  String get logout => 'Sign Out';
}
