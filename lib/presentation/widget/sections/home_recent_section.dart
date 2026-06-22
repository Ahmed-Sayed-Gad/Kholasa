import 'package:flutter/material.dart';
import '../../ui_models/recent_item_ui_model.dart';
import '../cards/recent_item_card.dart';
import '../states/home_recent_empty.dart';

class HomeRecentSection extends StatelessWidget {
  final List<RecentItemUiModel> items;

  const HomeRecentSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    // 🟡 Empty state
    if (items.isEmpty) {
      return const SliverToBoxAdapter(
        child: HomeRecentEmpty(),
      );
    }

    // 🟢 Success state
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            const SizedBox(height: 12),

            /// Render recent items
            ...items.map(
                  (item) => RecentItemCard(item: item),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {
            // TODO: navigate to full recent screen
          },
          child: Text(
            'See all',
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
