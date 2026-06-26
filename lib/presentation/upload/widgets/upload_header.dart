import 'package:flutter/material.dart';

class UploadHeader extends StatelessWidget {
  const UploadHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
            BorderRadius.circular(14),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Theme.of(context)
                  .iconTheme
                  .color,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          'New Summary',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color,
          ),
        ),
      ],
    );
  }
}