import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/di/di.dart';
import '../cubit/change_password_cubit.dart';
import '../cubit/change_password_state.dart';
import '../../widget/custom_form_field.dart';
import '../../../l10n/app_localizations.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isFormValid = false;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _updateFormValidity() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  Future<void> _onUpdatePressed() async {
    if (!_formKey.currentState!.validate()) return;

    final token = await secureStorage.read(key: 'token');

    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.tokenNotFound)),
      );
      return;
    }

    context.read<ChangePasswordCubit>().changePassword(
      token: token,
      oldPassword: currentPasswordController.text.trim(),
      newPassword: newPasswordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangePasswordCubit>(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.passwordChanged),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          }

          if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ChangePasswordLoading;

          return Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.changePassword)),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomFormField(
                      controller: currentPasswordController,
                      labelText: "Current Password",
                      isPassword: true,
                      validator: (v) =>
                          v == null || v.isEmpty ? "Required" : null,
                      onChanged: (_) => _updateFormValidity(),
                    ),

                    CustomFormField(
                      controller: newPasswordController,
                      labelText: "New Password",
                      isPassword: true,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Required";
                        }
                        if (v.length < 6) {
                          return "Min 6 characters";
                        }
                        return null;
                      },
                      onChanged: (_) => _updateFormValidity(),
                    ),

                    CustomFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      isPassword: true,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Required";
                        }
                        if (v != newPasswordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      onChanged: (_) => _updateFormValidity(),
                    ),

                    const SizedBox(height: 24),

                    if (isLoading) const CircularProgressIndicator(),

                    if (!isLoading)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isFormValid ? _onUpdatePressed : null,
                          child: Text(AppLocalizations.of(context)!.update),
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
