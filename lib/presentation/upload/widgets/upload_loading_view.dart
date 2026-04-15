// lib/presentation/upload/widgets/upload_loading_view.dart

import 'package:flutter/material.dart';

class UploadLoadingView
    extends StatelessWidget {
  const UploadLoadingView({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment
            .center,
        children: [
          CircularProgressIndicator(
            color: Theme.of(
                context)
                .colorScheme
                .primary,
          ),
          const SizedBox(
              height: 18),
          Text(
            'Uploading file...',
            style: TextStyle(
              color: Theme.of(
                  context)
                  .textTheme
                  .bodyMedium!
                  .color,
            ),
          ),
        ],
      ),
    );
  }
}