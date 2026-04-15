// lib/presentation/link/widgets/link_loading_view.dart

import 'package:flutter/material.dart';

import '../../../core/theme/color_manager.dart';

class LinkLoadingView extends StatelessWidget {
  const LinkLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(
          color: ColorManager.primary,
        ),
        const SizedBox(height: 16),
        Text(
          'Processing link...',
          style: TextStyle(
            color: ColorManager.hintTextColor,
          ),
        ),
      ],
    );
  }
}