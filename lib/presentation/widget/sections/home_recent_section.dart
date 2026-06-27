import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui_models/recent_item_ui_model.dart';
import '../../home/cubit/home_cubit.dart';
import '../cards/recent_item_card.dart';
import '../states/home_recent_empty.dart';

class HomeRecentSection extends StatefulWidget {
  final List<RecentItemUiModel> items;

  const HomeRecentSection({
    super.key,
    required this.items,
  });

  @override
  State<HomeRecentSection> createState() => _HomeRecentSectionState();
}

class _HomeRecentSectionState extends State<HomeRecentSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // 🟡 Empty state
    if (widget.items.isEmpty) {
      return const SliverToBoxAdapter(
        child: HomeRecentEmpty(),
      );
    }

    final displayedItems = _isExpanded
        ? widget.items
        : widget.items.take(3).toList();

    // 🟢 Success state
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              isExpanded: _isExpanded,
              onToggle: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            const SizedBox(height: 12),

            /// Render recent items
            ...displayedItems.map(
                  (item) {
                    return Dismissible(
                      key: Key('home_recent_${item.id}'),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.delete_outline, color: Colors.red),
                      ),
                      onDismissed: (direction) {
                        context.read<HomeCubit>().deleteItem(item.id);
                      },
                      child: RecentItemCard(item: item),
                    );
                  }
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const _Header({
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onToggle,
          child: Text(
            isExpanded ? 'See less' : 'See all',
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
