import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_one_c3_team/presentation/theme/theme_cubit.dart';
import 'package:project_one_c3_team/presentation/theme/theme_state.dart';

import 'core/Routs/app_routes_names.dart';
import 'core/Routs/App_Routs_page.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: App_Routs_names.HomeView,
                onGenerateRoute: AppRoutsPage.route,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state.mode,
              );
            },
          );
        },
      ),
    );
  }
}