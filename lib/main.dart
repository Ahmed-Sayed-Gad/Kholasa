import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/auth_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'core/services/snackbar_service.dart';
import 'core/services/notification_service.dart';

import 'presentation/theme/theme_cubit.dart';
import 'presentation/theme/theme_state.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/language/cubit/language_cubit.dart';
import 'presentation/language/cubit/language_state.dart';

import 'presentation/history/cubit/history_cubit.dart';

import 'core/di/di.dart';
import 'core/Routs/app_routes_names.dart';
import 'core/Routs/App_Routs_page.dart';
import 'core/theme/app_theme.dart';

import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // ✅ dependency injection
  await configureDependencies();

  // ✅ notifications init
  await NotificationService.initialize();

  // ✅ Android 13+ permission
  await Permission.notification.request();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),

        BlocProvider(create: (_) => LanguageCubit(getIt<SharedPreferences>())),

        // ✅ Global HistoryCubit
        BlocProvider(
          create: (_) => getIt<HistoryCubit>()..loadHistory(),
        ),
      ],

      child: ScreenUtilInit(
        designSize: const Size(360, 690),

        builder: (_, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, langState) {
                  return MaterialApp(
                    scaffoldMessengerKey: SnackbarService.messengerKey,
                    debugShowCheckedModeBanner: false,

                    initialRoute: App_Routs_names.splash,

                    onGenerateRoute: AppRoutsPage.route,


                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: themeState.mode,

                    locale: langState.locale,

                    supportedLocales: const [
                      Locale('en'),
                      Locale('ar'),
                    ],

                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}