import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Routs/app_routes_names.dart';
import '../../../core/di/di.dart';
import '../cubit/forget_password_cubit.dart';
import '../cubit/forget_password_state.dart';
import '../../widget/custom_form_field.dart';
import '../../widget/Validators.dart';
import '../../../l10n/app_localizations.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void _onContinuePressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context
        .read<ForgetPasswordCubit>()
        .sendCode(emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgetPasswordCubit>(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            print(
              "FORGET PASSWORD EMAIL => ${emailController.text.trim()}",
            );
            Navigator.pushReplacementNamed(
              context,
              App_Routs_names.verifyCodeScreen,
              arguments: emailController.text.trim(),
            );
          }

          if (state is ForgetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ForgetPasswordLoading;

          return Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.forgetPassword)),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Enter your email to receive a reset code",
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  Form(
                    key: _formKey,
                    child: CustomFormField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "example@email.com",
                      validator: Validators.email,
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed:
                      isLoading ? null : () => _onContinuePressed(context),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(AppLocalizations.of(context)!.continueText),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
