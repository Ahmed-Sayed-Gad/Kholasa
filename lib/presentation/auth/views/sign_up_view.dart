import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/auth/request/SignUpRequest.dart';
import '../../../core/di/di.dart';
import '../../../core/Routs/app_routes_names.dart';

import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';
import '../../widget/Validators.dart';
import '../../widget/custom_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() =>
      _SignUpViewState();
}

class _SignUpViewState
    extends State<SignUpView> {
  final _formKey =
  GlobalKey<FormState>();

  bool agree = false;

  final usernameController =
  TextEditingController();

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  final confirmPasswordController =
  TextEditingController();

  final phoneController =
  TextEditingController();

  void _onSignUpPressed(
      BuildContext context) {
    if (!_formKey.currentState!
        .validate()) return;

    if (!agree) return;

    final request =
    SignUpRequest(
      username:
      usernameController.text
          .trim(),
      email:
      emailController.text
          .trim(),
      password:
      passwordController.text
          .trim(),
      rePassword:
      confirmPasswordController
          .text
          .trim(),
      phone:
      phoneController.text
          .trim(),
    );

    context
        .read<SignUpCubit>()
        .signUp(request);
  }

  @override
  Widget build(
      BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<SignUpCubit>(),
      child: BlocConsumer<
          SignUpCubit,
          SignUpState>(
        listener:
            (context, state) {
          if (state
          is SignUpSuccess) {
            Navigator
                .pushReplacementNamed(
              context,
              App_Routs_names
                  .signInScreen,
            );
          }

          if (state
          is SignUpError) {
            ScaffoldMessenger.of(
                context)
                .showSnackBar(
              SnackBar(
                content: Text(
                    state.message),
                backgroundColor:
                Theme.of(context)
                    .colorScheme
                    .error,
              ),
            );
          }
        },
        builder:
            (context, state) {
          final isLoading =
          state
          is SignUpLoading;

          return Scaffold(
            backgroundColor:
            Theme.of(context)
                .scaffoldBackgroundColor,
            body: Center(
              child:
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/Logo.jpg",
                      width: 287,
                      height:
                      270,
                    ),

                    Text(
                      "Create your account",
                      style:
                      TextStyle(
                        color: Theme.of(
                            context)
                            .textTheme
                            .bodyLarge!
                            .color,
                        fontSize:
                        16,
                        fontWeight:
                        FontWeight
                            .w600,
                      ),
                    ),

                    Text(
                      "Start summarizing documents with AI",
                      style:
                      TextStyle(
                        fontSize:
                        14,
                        color: Theme.of(
                            context)
                            .textTheme
                            .bodyMedium!
                            .color,
                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),

                    const SizedBox(
                        height:
                        20),

                    Container(
                      width: MediaQuery.of(
                          context)
                          .size
                          .width *
                          .9,
                      padding:
                      const EdgeInsets
                          .all(
                          20),
                      decoration:
                      BoxDecoration(
                        color: Theme.of(
                            context)
                            .cardColor,
                        borderRadius:
                        BorderRadius.circular(
                            20),
                      ),
                      child:
                      Form(
                        key:
                        _formKey,
                        child:
                        Column(
                          children: [
                            CustomFormField(
                              controller:
                              usernameController,
                              labelText:
                              "Username",
                              validator:
                              Validators.name,
                            ),

                            CustomFormField(
                              controller:
                              emailController,
                              labelText:
                              "Email",
                              validator:
                              Validators.email,
                            ),

                            CustomFormField(
                              controller:
                              phoneController,
                              labelText:
                              "Phone",
                              validator:
                              Validators.phone,
                            ),

                            CustomFormField(
                              controller:
                              passwordController,
                              labelText:
                              "Password",
                              isPassword:
                              true,
                            ),

                            CustomFormField(
                              controller:
                              confirmPasswordController,
                              labelText:
                              "Confirm Password",
                              isPassword:
                              true,
                            ),

                            Row(
                              children: [
                                Checkbox(
                                  value:
                                  agree,
                                  activeColor:
                                  Theme.of(context)
                                      .colorScheme
                                      .primary,
                                  onChanged:
                                      (v) {
                                    setState(() {
                                      agree =
                                          v ??
                                              false;
                                    });
                                  },
                                ),
                                Text(
                                  "I agree to terms",
                                  style:
                                  TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                  ),
                                ),
                              ],
                            ),

                            ElevatedButton(
                              onPressed:
                              isLoading
                                  ? null
                                  : () => _onSignUpPressed(context),
                              child:
                              isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text("Create Account"),
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