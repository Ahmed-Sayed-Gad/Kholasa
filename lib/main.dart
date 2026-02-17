import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Routs/App_Routs_names.dart';
import 'core/Routs/App_Routs_page.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: App_Routs_names.HomeView,
          onGenerateRoute: AppRoutsPage.route,
          theme: AppTheme.darkTheme,
        );
      },
    );
  }
}
