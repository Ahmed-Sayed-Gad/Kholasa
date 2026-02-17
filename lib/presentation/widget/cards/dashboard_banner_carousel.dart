import 'dart:async';
import 'package:flutter/material.dart';
import '../../ui_models/banner_ui_model.dart';
import 'home_screen_banner_card.dart';

class DashboardBannerCarousel extends StatefulWidget {
  final List<HomeBannerUiModel> items;

  const DashboardBannerCarousel({
    super.key,
    required this.items,
  });

  @override
  State<DashboardBannerCarousel> createState() =>
      _DashboardBannerCarouselState();
}

class _DashboardBannerCarouselState extends State<DashboardBannerCarousel> {
  late final PageController _controller;
  Timer? _timer;
  double _page = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.92);

    _controller.addListener(() {
      setState(() {
        _page = _controller.page ?? 0;
      });
    });

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_controller.hasClients || widget.items.isEmpty) return;

      final nextPage = (_page.round() + 1) % widget.items.length;

      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 259,
          width: 414,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.items.length,
            itemBuilder: (_, index) {
              final item = widget.items[index];

              final delta = (_page - index).abs();
              final scale = (1 - delta * 0.08).clamp(0.92, 1.0);
              final opacity = (1 - delta * 0.3).clamp(0.6, 1.0);

              return Transform.scale(
                scale: scale,
                child: Opacity(
                  opacity: opacity,
                  child: HomeScreenBannerCard(
                    gradient: item.gradient,
                    icon: item.icon,
                    badge: item.badge,
                    title: item.title,
                    subtitle: item.subtitle,
                    buttonText: item.buttonText,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (i) {
            final active = _page.round() == i;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: active ? Colors.white : Colors.white38,
                borderRadius: BorderRadius.circular(6),
              ),
            );
          }),
        ),
      ],
    );
  }
}
