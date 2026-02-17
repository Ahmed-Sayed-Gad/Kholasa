import 'package:flutter/material.dart';
import '../../ui_models/banner_ui_model.dart';
import '../cards/dashboard_banner_carousel.dart';

class HomeBannerSection extends StatelessWidget {
  final List<HomeBannerUiModel> banners;

  const HomeBannerSection({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: DashboardBannerCarousel(items: banners),
    );
  }
}
