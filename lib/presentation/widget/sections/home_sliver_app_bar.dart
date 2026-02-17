import 'package:flutter/material.dart';
import '../../../core/theme/color_manager.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: ColorManager.primaryDark,
      elevation: 0,

      leading: Padding(
        padding: const EdgeInsets.all(7),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/LogoLight.jpg'),
        ),
      ),

      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_none,
                color: ColorManager.primaryDark),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: ColorManager.secondaryDark,
            child: Icon(Icons.person, color: ColorManager.textColor),
          ),
        ),
      ],
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: ColorManager.primaryDark),
      ),
    );
  }
}
