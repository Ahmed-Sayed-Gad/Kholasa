import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/upload_cubit.dart';

class UploadDropZone extends StatelessWidget {
  const UploadDropZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 26,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius:
        BorderRadius.circular(22),
        border: Border.all(
          color:
          Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.upload_outlined,
              size: 34,
              color: Theme.of(context)
                  .colorScheme
                  .primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Tap to browse or drag file',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Supports PDF, Word, TXT, JPG, PNG',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color,
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<UploadCubit>()
                    .pickFile();
              },
              child: const Text(
                'Choose File',
              ),
            ),
          ),
        ],
      ),
    );
  }
}