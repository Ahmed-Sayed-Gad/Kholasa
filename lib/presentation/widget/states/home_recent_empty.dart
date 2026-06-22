import 'package:flutter/material.dart';

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
            color: Theme.of(context).hintColor,
          ),
          const SizedBox(height: 12),
          Text(
            "No recent items yet",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
