import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';
import 'search_filter_button.dart';

class HomeSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const HomeSearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _SearchField(onChanged: onChanged),
          ),
          const SizedBox(width: 12),
          const SearchFilterButton(),
        ],
      ),
    );
  }
}
class _SearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const _SearchField({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(
        color: ColorManager.textColor,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: 'Search your task.....',
        hintStyle: const TextStyle(
          color: ColorManager.hintTextColor,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: ColorManager.hintTextColor,
        ),
        filled: true,
        fillColor: ColorManager.secondaryDark,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
