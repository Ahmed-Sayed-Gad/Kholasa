import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';

class UploadTabs extends StatelessWidget {
  const UploadTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.secondaryDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _TabItem(
            title: 'New Upload',
            selected: true,
          ),
          _TabItem(
            title: 'Recent Documents',
            selected: false,
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;

  const _TabItem({
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? ColorManager.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected
                  ? ColorManager.white
                  : ColorManager.hintTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
