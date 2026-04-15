// lib/presentation/upload/widgets/upload_idle_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/upload_cubit.dart';

class UploadIdleView
    extends StatelessWidget {
  const UploadIdleView({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {
    return Column(
      children: [
        const SizedBox(
            height: 24),

        Container(
          width: 72,
          height: 72,
          decoration:
          BoxDecoration(
            color: Theme.of(
                context)
                .colorScheme
                .primary
                .withOpacity(
                .14),
            shape:
            BoxShape.circle,
          ),
          child: Icon(
            Icons
                .upload_outlined,
            size: 34,
            color: Theme.of(
                context)
                .colorScheme
                .primary,
          ),
        ),

        const SizedBox(
            height: 28),

        Text(
          'Tap to browse or drag file',
          textAlign:
          TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight:
            FontWeight.w700,
            color: Theme.of(
                context)
                .textTheme
                .bodyLarge!
                .color,
          ),
        ),

        const SizedBox(
            height: 10),

        Text(
          'Supported formats: PDF, DOC, DOCX, TXT, JPG, PNG',
          textAlign:
          TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(
                context)
                .textTheme
                .bodyMedium!
                .color,
          ),
        ),

        const Spacer(),

        SizedBox(
          width:
          double.infinity,
          height: 56,
          child:
          ElevatedButton(
            onPressed: () {
              context
                  .read<
                  UploadCubit>()
                  .pickFile();
            },
            child: const Text(
              'Choose File',
            ),
          ),
        ),

        const SizedBox(
            height: 18),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment:
          WrapAlignment
              .center,
          children: const [
            _Chip(
                title:
                'PDF'),
            _Chip(
                title:
                'DOCX'),
            _Chip(
                title:
                'DOC'),
            _Chip(
                title:
                'TXT'),
            _Chip(
                title:
                'JPG'),
            _Chip(
                title:
                'PNG'),
          ],
        ),
      ],
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