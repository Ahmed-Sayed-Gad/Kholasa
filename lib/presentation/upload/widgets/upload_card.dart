import 'package:flutter/material.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/upload_state.dart';
import 'upload_error_view.dart';
import 'upload_idle_view.dart';
import 'upload_loading_view.dart';

class UploadCard extends StatelessWidget {
  final UploadState state;

  const UploadCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: ColorManager.secondaryDark,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: ColorManager.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (state is UploadIdle) {
      return const UploadIdleView();
    }

    if (state is UploadLoading) {
      return const UploadLoadingView();
    }

    if (state is UploadFailure) {
      final failure = state as UploadFailure;
      return UploadErrorView(message: failure.message);
    }

    return const UploadIdleView();
  }
}
