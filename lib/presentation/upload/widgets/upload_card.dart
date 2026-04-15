// lib/presentation/upload/widgets/upload_card.dart

import 'package:flutter/material.dart';

import '../cubit/upload_state.dart';
import 'upload_error_view.dart';
import 'upload_idle_view.dart';
import 'upload_loading_view.dart';

class UploadCard extends StatelessWidget {
  final UploadState state;

  const UploadCard({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration:
        const Duration(
            milliseconds: 250),
        width: double.infinity,
        padding:
        const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color:
          Theme.of(context)
              .cardColor,
          borderRadius:
          BorderRadius.circular(
              24),
          border: Border.all(
            color: Theme.of(context)
                .dividerColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(.08),
              blurRadius: 18,
              offset:
              const Offset(
                  0, 8),
            ),
          ],
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (state is UploadLoading) {
      return const UploadLoadingView();
    }

    if (state is UploadFailure) {
      final failure =
      state as UploadFailure;

      return UploadErrorView(
        message:
        failure.message,
      );
    }

    return const UploadIdleView();
  }
}