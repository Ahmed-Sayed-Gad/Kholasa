import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @managePreferences.
  ///
  /// In en, this message translates to:
  /// **'Manage your preferences'**
  String get managePreferences;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get account;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'PREFERENCES'**
  String get preferences;

  /// No description provided for @languagePreference.
  ///
  /// In en, this message translates to:
  /// **'Language Preference'**
  String get languagePreference;

  /// No description provided for @autoSave.
  ///
  /// In en, this message translates to:
  /// **'Auto-save Summaries'**
  String get autoSave;

  /// No description provided for @autoSaveDesc.
  ///
  /// In en, this message translates to:
  /// **'Automatically save all summaries'**
  String get autoSaveDesc;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get notifications;

  /// No description provided for @notificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Get notified when summaries are ready'**
  String get notificationsDesc;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @darkModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Use dark theme'**
  String get darkModeDesc;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'SUBSCRIPTION'**
  String get subscription;

  /// No description provided for @subscriptionBilling.
  ///
  /// In en, this message translates to:
  /// **'Subscription & Billing'**
  String get subscriptionBilling;

  /// No description provided for @freePlan.
  ///
  /// In en, this message translates to:
  /// **'Free Plan'**
  String get freePlan;

  /// No description provided for @privacySecurity.
  ///
  /// In en, this message translates to:
  /// **'PRIVACY & SECURITY'**
  String get privacySecurity;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get terms;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get logout;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @signInContinue.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account to continue'**
  String get signInContinue;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @historyDesc.
  ///
  /// In en, this message translates to:
  /// **'View all your past summaries'**
  String get historyDesc;

  /// No description provided for @noHistory.
  ///
  /// In en, this message translates to:
  /// **'No history yet'**
  String get noHistory;

  /// No description provided for @chatAssistant.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get chatAssistant;

  /// No description provided for @onlineNow.
  ///
  /// In en, this message translates to:
  /// **'Online now'**
  String get onlineNow;

  /// No description provided for @typing.
  ///
  /// In en, this message translates to:
  /// **'Typing...'**
  String get typing;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get typeMessage;

  /// No description provided for @pasteLink.
  ///
  /// In en, this message translates to:
  /// **'Paste Link'**
  String get pasteLink;

  /// No description provided for @pasteYourLink.
  ///
  /// In en, this message translates to:
  /// **'Paste your link here'**
  String get pasteYourLink;

  /// No description provided for @submitLink.
  ///
  /// In en, this message translates to:
  /// **'Submit Link'**
  String get submitLink;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @processingLink.
  ///
  /// In en, this message translates to:
  /// **'Processing link...'**
  String get processingLink;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @summaries.
  ///
  /// In en, this message translates to:
  /// **'summaries'**
  String get summaries;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPassword;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @exportSummary.
  ///
  /// In en, this message translates to:
  /// **'Export Summary'**
  String get exportSummary;

  /// No description provided for @pdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get pdf;

  /// No description provided for @txt.
  ///
  /// In en, this message translates to:
  /// **'TXT'**
  String get txt;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @both.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get both;

  /// No description provided for @generateAISummary.
  ///
  /// In en, this message translates to:
  /// **'Generate AI Summary'**
  String get generateAISummary;

  /// No description provided for @shortLength.
  ///
  /// In en, this message translates to:
  /// **'Short'**
  String get shortLength;

  /// No description provided for @mediumLength.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get mediumLength;

  /// No description provided for @longLength.
  ///
  /// In en, this message translates to:
  /// **'Long'**
  String get longLength;

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summaryTitle;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @scanImage.
  ///
  /// In en, this message translates to:
  /// **'Scan Image'**
  String get scanImage;

  /// No description provided for @scanAgain.
  ///
  /// In en, this message translates to:
  /// **'Scan Again'**
  String get scanAgain;

  /// No description provided for @acceptTerms.
  ///
  /// In en, this message translates to:
  /// **'Please accept terms and conditions'**
  String get acceptTerms;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful'**
  String get registrationSuccess;

  /// No description provided for @tokenNotFound.
  ///
  /// In en, this message translates to:
  /// **'Token not found, please login again'**
  String get tokenNotFound;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChanged;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @newSummary.
  ///
  /// In en, this message translates to:
  /// **'New Summary'**
  String get newSummary;

  /// No description provided for @summarizeAnotherUrl.
  ///
  /// In en, this message translates to:
  /// **'Summarize Another URL'**
  String get summarizeAnotherUrl;

  /// No description provided for @uploadFile.
  ///
  /// In en, this message translates to:
  /// **'Upload\nFile'**
  String get uploadFile;

  /// No description provided for @pasteLinkHome.
  ///
  /// In en, this message translates to:
  /// **'Paste\nLink'**
  String get pasteLinkHome;

  /// No description provided for @scanImageHome.
  ///
  /// In en, this message translates to:
  /// **'Scan\nImage'**
  String get scanImageHome;

  /// No description provided for @searchTask.
  ///
  /// In en, this message translates to:
  /// **'Search your task.....'**
  String get searchTask;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @firstSummary.
  ///
  /// In en, this message translates to:
  /// **'First Summary'**
  String get firstSummary;

  /// No description provided for @weekStreak.
  ///
  /// In en, this message translates to:
  /// **'Week Streak'**
  String get weekStreak;

  /// No description provided for @fiftySummaries.
  ///
  /// In en, this message translates to:
  /// **'50 Summaries'**
  String get fiftySummaries;

  /// No description provided for @createYourAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createYourAccountTitle;

  /// No description provided for @startSummarizingDesc.
  ///
  /// In en, this message translates to:
  /// **'Start summarizing documents with AI'**
  String get startSummarizingDesc;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @agreeToTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to terms'**
  String get agreeToTerms;

  /// No description provided for @selectDocToChat.
  ///
  /// In en, this message translates to:
  /// **'Select Document to Chat With'**
  String get selectDocToChat;

  /// No description provided for @selectDocFromLibrary.
  ///
  /// In en, this message translates to:
  /// **'Select a document from library...'**
  String get selectDocFromLibrary;

  /// No description provided for @noDocSelected.
  ///
  /// In en, this message translates to:
  /// **'No Document Selected'**
  String get noDocSelected;

  /// No description provided for @noDocSelectedDesc.
  ///
  /// In en, this message translates to:
  /// **'Please choose a document from the dropdown above to start a conversation and ask questions about its content.'**
  String get noDocSelectedDesc;

  /// No description provided for @answersBasedOnDoc.
  ///
  /// In en, this message translates to:
  /// **'Answers are based only on the contents of the selected document'**
  String get answersBasedOnDoc;

  /// No description provided for @askQuestionAbout.
  ///
  /// In en, this message translates to:
  /// **'Ask a question about'**
  String get askQuestionAbout;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @summaryTab.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summaryTab;

  /// No description provided for @compareTab.
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get compareTab;

  /// No description provided for @chatTab.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatTab;

  /// No description provided for @quizTab.
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quizTab;

  /// No description provided for @aiSummary.
  ///
  /// In en, this message translates to:
  /// **'AI Summary'**
  String get aiSummary;

  /// No description provided for @generatedJustNow.
  ///
  /// In en, this message translates to:
  /// **'Generated just now'**
  String get generatedJustNow;

  /// No description provided for @aiSummaryDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This summary was generated using AI. Please verify important information.'**
  String get aiSummaryDisclaimer;

  /// No description provided for @exportPdf.
  ///
  /// In en, this message translates to:
  /// **'Export PDF'**
  String get exportPdf;

  /// No description provided for @exportTxt.
  ///
  /// In en, this message translates to:
  /// **'Export TXT'**
  String get exportTxt;

  /// No description provided for @openFile.
  ///
  /// In en, this message translates to:
  /// **'Open file'**
  String get openFile;

  /// No description provided for @shareFile.
  ///
  /// In en, this message translates to:
  /// **'Share file'**
  String get shareFile;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @summariesCapitalized.
  ///
  /// In en, this message translates to:
  /// **'Summaries'**
  String get summariesCapitalized;

  /// No description provided for @hoursSaved.
  ///
  /// In en, this message translates to:
  /// **'Hours Saved'**
  String get hoursSaved;

  /// No description provided for @avidReader.
  ///
  /// In en, this message translates to:
  /// **'Avid Reader'**
  String get avidReader;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @totalSummaries.
  ///
  /// In en, this message translates to:
  /// **'Total Summaries'**
  String get totalSummaries;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @stayUpdated.
  ///
  /// In en, this message translates to:
  /// **'Stay updated with your summaries'**
  String get stayUpdated;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @noSavedYet.
  ///
  /// In en, this message translates to:
  /// **'No saved summaries yet'**
  String get noSavedYet;

  /// No description provided for @saveSummariesQuickly.
  ///
  /// In en, this message translates to:
  /// **'Save summaries to access them quickly.'**
  String get saveSummariesQuickly;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} minutes ago'**
  String minutesAgo(Object count);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} hours ago'**
  String hoursAgo(Object count);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(Object count);

  /// No description provided for @todayHeader.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayHeader;

  /// No description provided for @yesterdayHeader.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterdayHeader;

  /// No description provided for @olderHeader.
  ///
  /// In en, this message translates to:
  /// **'Older'**
  String get olderHeader;

  /// No description provided for @openAction.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openAction;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
