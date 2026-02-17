import 'package:flutter/material.dart';
import '../../domain/home/entities/home_banner.dart';

class BannerCarousel extends StatelessWidget {
  final List<HomeBanner> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return _BannerCard(banner: banner);
        },
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  final HomeBanner banner;

  const _BannerCard({required this.banner});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: banner.type == BannerType.schedule
                ? [const Color(0xFF6366F1), const Color(0xFF9333EA)]
                : [const Color(0xFF10B981), const Color(0xFF06B6D4)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              banner.badge,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              banner.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              banner.subtitle,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
