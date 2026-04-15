// lib/presentation/link/widgets/link_error_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/link_cubit.dart';

class LinkErrorView extends StatelessWidget {
  final String message;

  const LinkErrorView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline,
          color: ColorManager.error,
          size: 40,
        ),
        const SizedBox(height: 12),

        Text(
          message,
          style: TextStyle(
            color: ColorManager.error,
          ),
        ),

        const SizedBox(height: 20),

        TextButton(
          onPressed: () {
            context.read<LinkCubit>().reset();
          },
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}