import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/upload_card.dart';
import '../widgets/upload_tabs.dart';

class UploadView extends StatelessWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('uploda'),
        centerTitle: false,
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

            BlocBuilder<UploadCubit, UploadState>(
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
