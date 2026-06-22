// lib/presentation/link/widgets/link_error_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/link_cubit.dart';
import '../../../../l10n/app_localizations.dart';

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
          color: Theme.of(context).colorScheme.error,
          size: 40,
        ),
        const SizedBox(height: 12),

        Text(
          message,
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),

        const SizedBox(height: 20),

        TextButton(
          onPressed: () {
            context.read<LinkCubit>().reset();
          },
          child: Text(AppLocalizations.of(context)!.retry),
        ),
      ],
    );
  }
}