import 'package:flutter/material.dart';

class SummaryWarningText extends StatelessWidget {
  const SummaryWarningText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Please upload a document first',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodySmall?.color,
          fontSize: 12,
        ),
      ),
    );
  }
}
