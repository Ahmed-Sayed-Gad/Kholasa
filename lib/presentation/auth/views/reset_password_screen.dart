import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/Routs/app_routes_names.dart';
import '../../../core/di/di.dart';
import '../cubit/reset_password_cubit.dart';
import '../cubit/reset_password_state.dart';
import '../../widget/custom_form_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final email = await storage.read(key: "email");
    if (email == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email not found")),
      );
      return;
    }

    context.read<ResetPasswordCubit>().resetPassword(
      email: email,
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Navigator.pushReplacementNamed(
              context,
              App_Routs_names.signInScreen,
            );
          }

          if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final loading = state is ResetPasswordLoading;

          return Scaffold(
            appBar: AppBar(title: const Text("Reset Password")),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: passwordController,
                      labelText: "New Password",
                      isPassword: true,
                      validator: (v) =>
                      v == null || v.length < 6
                          ? "Min 6 characters"
                          : null,
                    ),

                    CustomFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      isPassword: true,
                      validator: (v) {
                        if (v != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    loading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => _submit(context),
                        child: const Text("Continue"),
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
