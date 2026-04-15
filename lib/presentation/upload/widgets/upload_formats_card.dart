import 'package:flutter/material.dart';

class UploadFormatsCard
    extends StatelessWidget {
  const UploadFormatsCard({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color:
        Theme.of(context)
            .cardColor,
        borderRadius:
        BorderRadius.circular(
            18),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment
            .start,
        children: [
          Text(
            'Supported Formats',
            style: TextStyle(
              fontSize: 15,
              fontWeight:
              FontWeight.w600,
              color: Theme.of(
                  context)
                  .textTheme
                  .bodyLarge!
                  .color,
            ),
          ),

          const SizedBox(
              height: 14),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _Chip(
                  title:
                  'PDF'),
              _Chip(
                  title:
                  'DOCX'),
              _Chip(
                  title:
                  'TXT'),
              _Chip(
                  title:
                  'JPG/PNG'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip
    extends StatelessWidget {
  final String title;

  const _Chip({
    required this.title,
  });

  @override
  Widget build(
      BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration:
      BoxDecoration(
        color: Theme.of(
            context)
            .dividerColor,
        borderRadius:
        BorderRadius.circular(
            20),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(
              context)
              .textTheme
              .bodyMedium!
              .color,
        ),
      ),
    );
  }
}