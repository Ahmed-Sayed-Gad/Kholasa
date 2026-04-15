import 'package:flutter/material.dart';

class UploadTabs extends StatelessWidget {
  const UploadTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Expanded(
            child: _TabItem(
              title: 'Files',
              selected: true,
            ),
          ),
          Expanded(
            child: _TabItem(
              title: 'Link',
              selected: false,
            ),
          ),
          Expanded(
            child: _TabItem(
              title: 'Text',
              selected: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;

  const _TabItem({
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
      const Duration(milliseconds: 220),
      decoration: BoxDecoration(
        color: selected
            ? Theme.of(context)
            .colorScheme
            .primary
            : Colors.transparent,
        borderRadius:
        BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: selected
                ? Theme.of(context)
                .colorScheme
                .onPrimary
                : Theme.of(context)
                .textTheme
                .bodyMedium!
                .color,
          ),
        ),
      ),
    );
  }
}