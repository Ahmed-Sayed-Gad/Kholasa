// lib/presentation/link/widgets/link_card.dart

import 'package:flutter/material.dart';

class LinkCard extends StatelessWidget {
  final Widget child;

  const LinkCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(.18),
        ),
      ),
      child: child,
    );
  }
}