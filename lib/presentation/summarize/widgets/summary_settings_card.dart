import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';
import 'summary_length_slider.dart';
import 'focus_area_chips.dart';
import 'generate_summary_button.dart';
import 'summary_warning_text.dart';

class SummarySettingsCard extends StatelessWidget {
  const SummarySettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.secondaryDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.primary),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          SummaryLengthSlider(),
          SizedBox(height: 16),
          FocusAreaChips(),
          SizedBox(height: 24),
          GenerateSummaryButton(),
          SizedBox(height: 12),
          SummaryWarningText(),
        ],
      ),
    );
  }
}
