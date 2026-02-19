import 'package:flutter/material.dart';

class SummarizeResult extends StatelessWidget {
  final String summary;

  const SummarizeResult({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        summary,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
