import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/upload_card.dart';
import '../widgets/upload_tabs.dart';
import '../../summarize/view/summarize_view.dart';
import '../../../core/theme/color_manager.dart';

class UploadView extends StatelessWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage your account and preferences',
              style: TextStyle(
                color: ColorManager.hintTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            const UploadTabs(),
            const SizedBox(height: 16),

            /// ✅ الحل هنا
            BlocConsumer<UploadCubit, UploadState>(
              listener: (context, state) {
                if (state is UploadSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SummarizeView(file: state.file),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return UploadCard(state: state);
              },
            ),
          ],
        ),
      ),
    );
  }
}
