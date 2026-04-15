// lib/presentation/upload/widgets/upload_error_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/upload_cubit.dart';

class UploadErrorView
    extends StatelessWidget {
  final String message;

  const UploadErrorView({
    super.key,
    required this.message,
  });

  @override
  Widget build(
      BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment
            .center,
        children: [
          Icon(
            Icons
                .error_outline,
            size: 44,
            color: Theme.of(
                context)
                .colorScheme
                .error,
          ),
          const SizedBox(
              height: 14),
          Text(
            message,
            textAlign:
            TextAlign.center,
            style: TextStyle(
              color: Theme.of(
                  context)
                  .textTheme
                  .bodyLarge!
                  .color,
            ),
          ),
          const SizedBox(
              height: 18),
          ElevatedButton(
            onPressed: () {
              context
                  .read<
                  UploadCubit>()
                  .reset();
            },
            child:
            const Text(
              'Try Again',
            ),
          ),
        ],
      ),
    );
  }
}