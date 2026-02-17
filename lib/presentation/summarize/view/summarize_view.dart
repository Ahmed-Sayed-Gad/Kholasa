import 'package:flutter/material.dart';
import 'summarize_body.dart';

class SummarizeView extends StatelessWidget {
  const SummarizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Summary'),
      ),
      body: SummarizeBody(),
    );
  }
}
