import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Routs/app_routes_names.dart';
import '../../../core/di/di.dart';
import '../cubit/reset_password_cubit.dart';
import '../cubit/reset_password_state.dart';
import '../../widget/custom_form_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() =>
      _ResetPasswordViewState();
}

class _ResetPasswordViewState
    extends State<ResetPasswordView> {

  final _formKey =
  GlobalKey<FormState>();

  String email = '';
  String token = '';

  final passwordController =
  TextEditingController();

  final confirmPasswordController =
  TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments;

    print("RESET ARGS => $args");

    if (args is Map<String, dynamic>) {
      email = args["email"] ?? '';
      token = args["token"] ?? '';
    }

    print("RESET EMAIL => $email");
    print("RESET TOKEN => $token");
  }

  void _submit(BuildContext context) {

    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    if (email.isEmpty ||
        token.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Missing email or token",
          ),
        ),
      );

      return;
    }

    context
        .read<ResetPasswordCubit>()
        .resetPassword(
      email: email,
      token: token,
      password:
      passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) =>
          getIt<ResetPasswordCubit>(),
      child: BlocConsumer<
          ResetPasswordCubit,
          ResetPasswordState>(
        listener:
            (context, state) {

          if (state
          is ResetPasswordSuccess) {

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              const SnackBar(
                content: Text(
                  "Password reset successfully",
                ),
              ),
            );

            Navigator
                .pushReplacementNamed(
              context,
              App_Routs_names
                  .LoginScreen,
            );
          }

          if (state
          is ResetPasswordError) {

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                ),
              ),
            );
          }
        },
        builder:
            (context, state) {

          final loading =
          state
          is ResetPasswordLoading;

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Reset Password",
              ),
            ),
            body: Padding(
              padding:
              const EdgeInsets.all(
                16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    CustomFormField(
                      controller:
                      passwordController,
                      labelText:
                      "New Password",
                      isPassword:
                      true,
                      validator: (v) {
                        if (v == null ||
                            v.length < 6) {
                          return "Min 6 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    CustomFormField(
                      controller:
                      confirmPasswordController,
                      labelText:
                      "Confirm Password",
                      isPassword:
                      true,
                      validator: (v) {

                        if (v !=
                            passwordController
                                .text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    loading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                      width:
                      double.infinity,
                      height: 50,
                      child:
                      ElevatedButton(
                        onPressed: () =>
                            _submit(
                              context,
                            ),
                        child:
                        const Text(
                          "Continue",
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