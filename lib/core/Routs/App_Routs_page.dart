import 'package:flutter/material.dart';
import '../../presentation/App_pages/home_shell_page.dart';

import '../../presentation/auth/views/sign_in_view.dart';
import '../../presentation/auth/views/sign_up_view.dart';
import '../../presentation/auth/views/change_password_page.dart';
import '../../presentation/auth/views/forget_password_view.dart';
import '../../presentation/auth/views/reset_password_screen.dart';
import '../../presentation/auth/views/verify_reset_code.dart';
import 'app_routes_names.dart';

interface class AppRoutsPage {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case App_Routs_names.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case App_Routs_names.signInScreen:
        return MaterialPageRoute(builder: (context) => SignInView());
      case App_Routs_names.HomeView:
        return MaterialPageRoute(builder: (_) => HomeShellPage());
      case App_Routs_names.resetPasswordScreen:
        return MaterialPageRoute(builder: (context) => ResetPasswordView());
      case App_Routs_names.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      case App_Routs_names.verifyCodeScreen:
        return MaterialPageRoute(builder: (context) => VerifyCodeView());
      case App_Routs_names.changePasswordPage:
        return MaterialPageRoute(builder: (context) => ChangePasswordPage());
      default:
        return MaterialPageRoute(builder: (context) => SignInView());
    }
  }
}
