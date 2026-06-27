import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';

import '../../upload/cubit/upload_cubit.dart';
import '../../upload/views/upload_view.dart';

import '../../link/cubit/link_cubit.dart';
import '../../link/views/link_view.dart';

import '../../scan/cubit/scan_cubit.dart';
import '../../scan/views/scan_view.dart';
import '../../export/cubit/export_cubit.dart';
import '../../../../l10n/app_localizations.dart';

class UploadActionsSection extends StatelessWidget {
  const UploadActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(
            child: _ActionCard(
              title: AppLocalizations.of(context)!.uploadFile,
              icon: Icons.upload_outlined,
              type: _ActionType.upload,
              iconColor: Color(0xFF22D3EE),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _ActionCard(
              title: AppLocalizations.of(context)!.pasteLinkHome,
              icon: Icons.link_rounded,
              type: _ActionType.link,
              iconColor: Color(0xFF3B82F6),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _ActionCard(
              title: AppLocalizations.of(context)!.scanImageHome,
              icon: Icons.qr_code_scanner_rounded,
              type: _ActionType.scan,
              iconColor: Color(0xFFC084FC),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

enum _ActionType { upload, link, scan }

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final _ActionType type;
  final Color iconColor;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.type,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => _onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    switch (type) {
      case _ActionType.upload:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => getIt<UploadCubit>(),
              child: const UploadView(),
            ),
          ),
        );
        break;

      case _ActionType.link:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => getIt<LinkCubit>(),
              child: const LinkView(),
            ),
          ),
        );
        break;

      case _ActionType.scan:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => getIt<ScanCubit>(),
                ),
                BlocProvider(
                  create: (_) => getIt<ExportCubit>(),
                ),
              ],
              child: const ScanView(),
            ),
          ),
        );
        break;
    }
  }
}
