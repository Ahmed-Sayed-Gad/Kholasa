import 'package:flutter/material.dart';

class SummaryHeader extends StatelessWidget {
  const SummaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary Settings',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Customize how your document is summarized',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
