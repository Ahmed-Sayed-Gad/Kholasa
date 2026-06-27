import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/reduced_font_theme.dart';

import '../../../api/auth/request/login_request.dart';
import '../../../core/Routs/app_routes_names.dart';
import '../../../core/di/di.dart';

import '../../../l10n/app_localizations.dart';
import '../../widget/custom_form_field.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import 'forget_password_view.dart';
import '../../../domain/home/UseCase/remember_me_usecase.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _rememberMe = true;

  @override
  void initState() {
    super.initState();
    _loadRememberedCredentials();
  }

  Future<void> _loadRememberedCredentials() async {
    final rememberMeResult = await getIt<RememberMeUseCase>().loadRememberMe();
    if (rememberMeResult.rememberMe && rememberMeResult.email != null) {
      setState(() {
        emailController.text = rememberMeResult.email!;
        _rememberMe = true;
      });
    }
  }

  void _onLoginPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final request = LoginRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    context.read<LoginCubit>().login(request, _rememberMe);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, App_Routs_names.HomeView);
          }

          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;

          return ReducedFontTheme(
            child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: 287,
                      height: 287,
                      child: Image.asset("assets/images/Logo.jpg"),
                    ),

                    Text(
                      AppLocalizations.of(context)!.welcomeBack,
                    ),
                    const SizedBox(height: 8),

                    Text(
                      AppLocalizations.of(context)!.signInContinue,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.08),
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.login,
                            ),
                            const SizedBox(height: 6),

                            Text(
                              "Enter your credentials to access your account",
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 20),

                            CustomFormField(
                              controller: emailController,
                              labelText: "Email",
                              hintText: "name@example.com",
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return AppLocalizations.of(context)!.required;
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            CustomFormField(
                              controller: passwordController,
                              labelText: "Password",
                              hintText: "********",
                              isPassword: true,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return AppLocalizations.of(context)!.required;
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: _rememberMe,
                                    onChanged: (val) {
                                      setState(() {
                                        _rememberMe = val ?? false;
                                      });
                                    },
                                    activeColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _rememberMe = !_rememberMe;
                                    });
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.rememberMe,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).textTheme.bodyMedium?.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          App_Routs_names.RegisterScreen,
                                        );

                                      },
                                      child: Text(AppLocalizations.of(context)!.createAccount),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          App_Routs_names.forgetPasswordScreen,
                                        );

                                      },
                                      child: Text(AppLocalizations.of(context)!.forgetPassword),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF22D3EE),
                                    Color(0xFF38BDF8),
                                  ],
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () => _onLoginPressed(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        AppLocalizations.of(context)!.login,
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),);
        },
      ),
    );
  }
}
