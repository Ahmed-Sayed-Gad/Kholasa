import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Routs/app_routes_names.dart';
import '../../../core/di/di.dart';
import '../cubit/verify_reset_code_cubit.dart';
import '../cubit/verify_reset_code_state.dart';


class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key});

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());

  String get _code =>
      _controllers.map((c) => c.text).join();

  void _submit(BuildContext context) {
    if (_code.length != 6) return;

    context.read<VerifyResetCodeCubit>().verifyCode(_code);
  }

  Widget _box(int index) {
    return SizedBox(
      width: 45,
      child: TextField(
        controller: _controllers[index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(counterText: ''),
        onChanged: (v) {
          if (v.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
          if (_controllers.every((c) => c.text.isNotEmpty)) {
            _submit(context);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VerifyResetCodeCubit>(),
      child: BlocConsumer<VerifyResetCodeCubit, VerifyResetCodeState>(
        listener: (context, state) {
          if (state is VerifyResetCodeSuccess) {
            Navigator.pushReplacementNamed(
              context,
              App_Routs_names.resetPasswordScreen,
            );
          }

          if (state is VerifyResetCodeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final loading = state is VerifyResetCodeLoading;

          return Scaffold(
            appBar: AppBar(title: const Text("Verification")),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enter the 6-digit code sent to your email",
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, _box),
                ),

                const SizedBox(height: 30),

                loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () => _submit(context),
                  child: const Text("Verify"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
