import 'package:flutter/material.dart';
import 'summary_header.dart';
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
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SummaryHeader(),
          SizedBox(height: 16),
          SummaryLengthSlider(),
          SizedBox(height: 20),
          FocusAreaChips(),
          SizedBox(height: 24),
          GenerateSummaryButton(),
          SizedBox(height: 8),
          SummaryWarningText(),
        ],
      ),
    );
  }
}
