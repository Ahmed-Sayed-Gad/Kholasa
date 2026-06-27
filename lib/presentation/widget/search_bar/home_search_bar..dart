import 'package:flutter/material.dart';
import 'search_filter_button.dart';
import '../../../../l10n/app_localizations.dart';

class HomeSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const HomeSearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: _SearchField(
              onChanged: onChanged,
            ),
          ),
          const SizedBox(width: 12),
          const SearchFilterButton(),
        ],
      ),
    );
  }
}

class _SearchField
    extends StatelessWidget {
  final ValueChanged<String>?
  onChanged;

  const _SearchField({
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(
        color:
        Theme.of(context)
            .textTheme
            .bodyLarge!
            .color,
        fontSize: 17,
      ),
      decoration:
      InputDecoration(
        hintText: AppLocalizations.of(context)!.searchTask,
        prefixIcon: Icon(
          Icons.search,
          color:
          Theme.of(context)
              .textTheme
              .bodyMedium!
              .color,
        ),
        fillColor:
        Theme.of(context)
            .cardColor,
      ),
    );
  }
}