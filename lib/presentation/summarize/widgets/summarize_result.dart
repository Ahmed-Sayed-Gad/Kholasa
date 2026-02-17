import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';
import '../../../domain/summarize/entities/summary_result.dart';

class SummarizeResult extends StatelessWidget {
  final SummaryResult result;

  const SummarizeResult({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.secondaryDark,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            const SizedBox(height: 12),
            _SummaryText(text: result.summary),
            const SizedBox(height: 16),
            _MetaInfo(
              pages: result.pages,
              language: result.language,
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= HEADER ================= */

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.auto_awesome,
          color: ColorManager.yellow,
          size: 22,
        ),
        const SizedBox(width: 8),
        Text(
          'AI Summary',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

/* ================= SUMMARY TEXT ================= */

class _SummaryText extends StatelessWidget {
  final String text;

  const _SummaryText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        height: 1.6,
        color: ColorManager.textColorSecondary,
      ),
    );
  }
}

/* ================= META INFO ================= */

class _MetaInfo extends StatelessWidget {
  final int pages;
  final String language;

  const _MetaInfo({
    required this.pages,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MetaChip(
          icon: Icons.description_outlined,
          label: '$pages pages',
        ),
        const SizedBox(width: 12),
        _MetaChip(
          icon: Icons.language,
          label: language.toUpperCase(),
        ),
      ],
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MetaChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: ColorManager.primaryDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorManager.containerGray.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: ColorManager.grey),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ColorManager.grey,
            ),
          ),
        ],
      ),
    );
  }
}
