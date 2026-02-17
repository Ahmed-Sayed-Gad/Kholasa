import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';

class HomeRecentEmpty extends StatelessWidget {
  const HomeRecentEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: ColorManager.hintTextColor,
          ),
          const SizedBox(height: 12),
          Text(
            "No recent items yet",
            style: TextStyle(
              color: ColorManager.textColorSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
