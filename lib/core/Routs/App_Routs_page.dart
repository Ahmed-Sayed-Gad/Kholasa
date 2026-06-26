import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/di.dart';
import '../../presentation/splash/view/splash_view.dart';
import '../../presentation/splash/cubit/splash_cubit.dart';
import '../../presentation/App_pages/home_shell_page.dart';

import '../../presentation/auth/views/login_view.dart';
import '../../presentation/auth/views/register_view.dart';
import '../../presentation/auth/views/change_password_page.dart';
import '../../presentation/auth/views/forget_password_view.dart';
import '../../presentation/auth/views/reset_password_screen.dart';
import '../../presentation/auth/views/verify_reset_code.dart';
import 'app_routes_names.dart';

interface class AppRoutsPage {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<SplashCubit>(),
            child: const SplashView(),
          ),
        );
      case App_Routs_names.RegisterScreen:
        return MaterialPageRoute(builder: (context) => RegisterView());
      case App_Routs_names.LoginScreen:
        return MaterialPageRoute(builder: (context) => LoginView());
      case App_Routs_names.HomeView:
        return MaterialPageRoute(builder: (_) => HomeShellPage());
      case App_Routs_names.resetPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ResetPasswordView(),
        );
      case App_Routs_names.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      case App_Routs_names.verifyCodeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const VerifyCodeView(),
        );
      case App_Routs_names.changePasswordPage:
        return MaterialPageRoute(builder: (context) => ChangePasswordPage());
      default:
        return MaterialPageRoute(builder: (context) => LoginView());
    }
  }
}

