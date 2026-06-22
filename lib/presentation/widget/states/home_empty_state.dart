import 'package:flutter/material.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox, size: 64, color: Theme.of(context).hintColor),
          const SizedBox(height: 12),
          Text(
            "No recent items yet",
            style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
        ],
      ),
    );
  }
}
