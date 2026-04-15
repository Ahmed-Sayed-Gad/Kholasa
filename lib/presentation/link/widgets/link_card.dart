// lib/presentation/link/widgets/link_card.dart

import 'package:flutter/material.dart';

import '../../../core/theme/color_manager.dart';

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
        color: ColorManager.secondaryDark,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: ColorManager.primary.withOpacity(.18),
        ),
      ),
      child: child,
    );
  }
}