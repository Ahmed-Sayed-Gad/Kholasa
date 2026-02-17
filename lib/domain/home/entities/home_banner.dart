class HomeBanner {
  final String title;
  final String subtitle;
  final String badge;
  final BannerType type;

  HomeBanner({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.type,
  });
}

enum BannerType {
  schedule,
  achievement,
}
