import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Routs/app_routes_names.dart';
import '../../../core/di/di.dart';
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
            Navigator.pushReplacementNamed(context, App_Routs_names.HomeView);
          }

          if (state is SignInError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is SignInLoading;

          return Scaffold(
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
                      "Welcome back",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Sign in to your account to continue",
                      style: TextStyle(
                        fontSize: 16,
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
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.color,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "Enter your credentials to access your account",
                              style: TextStyle(
                                fontSize: 14,
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
                                  return "Required";
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
                              validator: (val) => val == null || val.isEmpty
                                  ? "Required"
                                  : null,
                            ),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    App_Routs_names.forgetPasswordScreen,
                                  );
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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
                                    : () => _onSignInPressed(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Sign In",
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
          );
        },
      ),
    );
  }
}
