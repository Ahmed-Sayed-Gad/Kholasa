import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../widget/reduced_font_theme.dart';

import '../cubit/scan_cubit.dart';
import '../cubit/scan_state.dart';
import '../../summarize/widgets/summarize_result.dart';
import '../../../../l10n/app_localizations.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReducedFontTheme(
      child: Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.scanImage),
      ),

      body: BlocBuilder<ScanCubit, ScanState>(
        builder: (context, state) {
          if (state is ScanLoading) {
            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          if (state is ScanSuccess) {
            return SummarizeResult(
              summary: state.text,
              fileTitle: state.image.path.split(RegExp(r'[/\\]')).last,
            );
          }

          if (state is ScanFailure) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _OptionCard(
                  title: 'Take Photo',
                  description: 'Scan document using device camera',
                  icon: Icons.camera_alt_outlined,
                  onTap: () {
                    context.read<ScanCubit>().scanImage(ImageSource.camera);
                  },
                ),
                const SizedBox(height: 16),
                _OptionCard(
                  title: 'Choose from Gallery',
                  description: 'Select existing photo from gallery',
                  icon: Icons.photo_library_outlined,
                  onTap: () {
                    context.read<ScanCubit>().scanImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        },
      ),
    ),);
  }
}

class _OptionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _OptionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Theme.of(context).primaryColor, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Theme.of(context).hintColor),
          ],
        ),
      ),
    );
  }
}