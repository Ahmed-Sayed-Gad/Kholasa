import 'package:flutter/material.dart';

class SummaryHeader extends StatelessWidget {
  final int pages;
  final String language;

  const SummaryHeader({
    super.key,
    required this.pages,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.auto_awesome, color: Colors.deepPurple),
        const SizedBox(width: 8),
        const Text(
          'AI Summary',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          '$pages pages • ${language.toUpperCase()}',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
