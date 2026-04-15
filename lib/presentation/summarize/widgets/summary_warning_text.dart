import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';

class SummaryWarningText extends StatelessWidget {
  const SummaryWarningText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Please upload a document first',
        style: TextStyle(
          color: ColorManager.textColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
