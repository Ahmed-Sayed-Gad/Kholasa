import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/auth/request/SignUpRequest.dart';
import '../../../core/di/di.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/Routs/App_Routs_names.dart';

import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';
import '../../widget/Validators.dart';
import '../../widget/custom_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  bool agree = false;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  void _onSignUpPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    if (!agree) return;

    final request = SignUpRequest(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      rePassword: confirmPasswordController.text.trim(),
      phone: phoneController.text.trim(),
    );

    context.read<SignUpCubit>().signUp(request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushReplacementNamed(
              context,
              App_Routs_names.signInScreen,
            );
          }

          if (state is SignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: ColorManager.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final bool isLoading = state is SignUpLoading;

          return Scaffold(
            backgroundColor: ColorManager.primaryDark,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/Logo.jpg",
                      width: 287,
                      height: 270,
                    ),

                    const Text(
                      "Create your account",
                      style: TextStyle(
                        color: ColorManager.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Text(
                      "Start summarizing documents with AI",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorManager.textColorSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ColorManager.secondaryDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [

                            CustomFormField(
                              controller: usernameController,
                              labelText: "Username",
                              validator: Validators.name,
                            ),

                            CustomFormField(
                              controller: emailController,
                              labelText: "Email",
                              validator: Validators.email,
                            ),

                            CustomFormField(
                              controller: phoneController,
                              labelText: "Phone",
                              validator: Validators.phone,
                            ),

                            CustomFormField(
                              controller: passwordController,
                              labelText: "Password",
                              isPassword: true,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Required";
                                }
                                if (val.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },

                            ),

                            CustomFormField(
                              controller: confirmPasswordController,
                              labelText: "Confirm Password",
                              isPassword: true,
                              validator: (val) {
                                if (val != passwordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),

                            Row(
                              children: [
                                Checkbox(
                                  value: agree,
                                  onChanged: (v) {
                                    setState(() {
                                      agree = v ?? false;
                                    });
                                  },
                                ),
                                const Text("I agree to terms"),
                              ],
                            ),

                            const SizedBox(height: 20),

                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () => _onSignUpPressed(context),
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text("Create Account"),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Back to Login"),
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

