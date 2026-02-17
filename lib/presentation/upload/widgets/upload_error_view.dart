import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/upload_cubit.dart';

class UploadErrorView extends StatelessWidget {
  final String message;

  const UploadErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.error_outline, color: ColorManager.error, size: 36),
        const SizedBox(height: 8),

        Text(
          message,
          style: TextStyle(color: ColorManager.error),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        TextButton(
          onPressed: () => context.read<UploadCubit>().reset(),
          child: const Text('Try again'),
        ),
      ],
    );
  }
}
