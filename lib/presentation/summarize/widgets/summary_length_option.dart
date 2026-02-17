import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';

class SummaryLengthOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;

  const SummaryLengthOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? ColorManager.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorManager.primary),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected
                    ? ColorManager.white
                    : ColorManager.textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: ColorManager.hintTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
