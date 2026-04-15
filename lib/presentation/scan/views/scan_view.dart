// lib/presentation/scan/views/scan_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/scan_cubit.dart';
import '../cubit/scan_state.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDark,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryDark,
        title: const Text('Scan Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<ScanCubit, ScanState>(
          listener: (context, state) {
            if (state is ScanSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Image scanned successfully'),
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: state is ScanLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  context.read<ScanCubit>().scanImage();
                },
                child: const Text('Start Scan'),
              ),
            );
          },
        ),
      ),
    );
  }
}