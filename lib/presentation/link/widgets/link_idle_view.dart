import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/link_cubit.dart';

class LinkIdleView extends StatelessWidget {
  final TextEditingController controller;

  const LinkIdleView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.link_rounded,
          size: 48,
          color:
          Theme.of(context)
              .colorScheme
              .primary,
        ),

        const SizedBox(height: 16),

        Text(
          'Paste your link here',
          style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Web pages, PDF links, docs & more',
          style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyMedium!
                .color,
          ),
        ),

        const SizedBox(height: 24),

        TextField(
          controller: controller,
          style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color,
          ),
          decoration: InputDecoration(
            hintText: 'https://example.com',
            fillColor:
            Theme.of(context).cardColor,
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context
                  .read<LinkCubit>()
                  .submitLink(
                controller.text,
              );
            },
            child: const Text(
              'Submit Link',
            ),
          ),
        ),
      ],
    );
  }
}