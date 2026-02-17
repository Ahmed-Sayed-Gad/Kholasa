import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Routs/App_Routs_names.dart';
import '../../../core/di/di.dart';
import '../../../core/theme/color_manager.dart';
import '../../../api/auth/request/sign_in_request.dart';

import '../../widget/custom_form_field.dart';
import '../cubit/signin_cubit.dart';
import '../cubit/signin_state.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onSignInPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final request = SignInRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    context.read<SignInCubit>().signIn(request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignInCubit>(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            Navigator.pushReplacementNamed(
              context,
              App_Routs_names.HomeView,
            );
          }

          if (state is SignInError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final bool isLoading = state is SignInLoading;

          return Scaffold(
            backgroundColor: ColorManager.primaryDark,
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

                    const SizedBox(),

                    const Text(
                      "Welcome back",
                      style: TextStyle(
                        color: ColorManager.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Sign in to your account to continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.textColorSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: ColorManager.secondaryDark,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
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

                            const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textColor,
                              ),
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Enter your credentials to access your account",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorManager.textColorSecondary,
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
                                  return "Required";
                                }
                                final emailRegex = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );
                                if (!emailRegex.hasMatch(val)) {
                                  return "Invalid email";
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
                              validator: (val) =>
                              val == null || val.isEmpty
                                  ? "Required"
                                  : null,
                            ),

                            const SizedBox(height: 4),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    App_Routs_names.forgetPasswordScreen,
                                  );
                                },
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff22D3EE),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            Container(
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF22D3EE),
                                    Color(0xFF38BDF8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () => _onSignInPressed(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                    : Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color:
                                    ColorManager.textColorSecondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      App_Routs_names.signUpScreen,
                                    );
                                  },
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                      color: Color(0xff22D3EE),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
