import 'package:flutter/material.dart';

class UploadBottomButton
    extends StatelessWidget {
  const UploadBottomButton({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'Configure AI Settings →',
        ),
      ),
    );
  }
}