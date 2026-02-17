import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';

class UploadLoadingView extends StatelessWidget {
  const UploadLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(color: ColorManager.primary),
        const SizedBox(height: 16),
        Text(
          'Uploading file...',
          style: TextStyle(color: ColorManager.hintTextColor),
        ),
      ],
    );
  }
}
