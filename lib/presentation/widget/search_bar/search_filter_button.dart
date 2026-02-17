import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';

class SearchFilterButton extends StatelessWidget {
  const SearchFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        // TODO: open filter bottom sheet
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: ColorManager.secondaryDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: ColorManager.hintTextColor.withOpacity(0.2),
          ),
        ),
        child: const Icon(
          Icons.tune,
          color: ColorManager.textColor,
        ),
      ),
    );
  }
}
