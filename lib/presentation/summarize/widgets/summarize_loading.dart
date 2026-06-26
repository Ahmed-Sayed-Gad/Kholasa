import 'package:flutter/material.dart';

class SummarizeLoadingView extends StatelessWidget {
  const SummarizeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(strokeWidth: 3),
          SizedBox(height: 20),
          Text(
            'Analyzing your document…',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 6),
          Text(
            'This may take a few seconds',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
