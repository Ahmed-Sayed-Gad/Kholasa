import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/reduced_font_theme.dart';

import '../../../api/auth/request/register_request.dart';
import '../../../core/di/di.dart';
import '../../../core/Routs/app_routes_names.dart';

import '../../widget/Validators.dart';
import '../../widget/custom_form_field.dart';
import '../../../l10n/app_localizations.dart';

import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  bool agree = false;

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();



  void _onRegisterPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.acceptTerms)),
      );
      return;
    }



    final request = RegisterRequest(
      name: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    context.read<RegisterCubit>().register(request);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppLocalizations.of(context)!.registrationSuccess)),
            );

            Navigator.pushReplacementNamed(
              context,
              App_Routs_names.LoginScreen,
            );
          }

          if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is RegisterLoading;

          return ReducedFontTheme(
            child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/Logo.jpg",
                      width: 287,
                      height: 270,
                    ),

                    Text(
                      AppLocalizations.of(context)!.createYourAccountTitle,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      AppLocalizations.of(context)!.startSummarizingDesc,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomFormField(
                              controller: usernameController,
                              labelText: AppLocalizations.of(context)!.username,
                              validator: Validators.name,
                            ),

                            CustomFormField(
                              controller: emailController,
                              labelText: AppLocalizations.of(context)!.email,
                              validator: Validators.email,
                            ),



                            CustomFormField(
                              controller: passwordController,
                              labelText: AppLocalizations.of(context)!.password,
                              isPassword: true,
                            ),



                            Row(
                              children: [
                                Checkbox(
                                  value: agree,
                                  activeColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  onChanged: (v) {
                                    setState(() {
                                      agree = v ?? false;
                                    });
                                  },
                                ),
                                Text(
                                  AppLocalizations.of(context)!.agreeToTerms,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge!.color,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () => _onRegisterPressed(context),
                                child: isLoading
                                    ? const CircularProgressIndicator()
                                    : Text(AppLocalizations.of(context)!.createAccount),
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
