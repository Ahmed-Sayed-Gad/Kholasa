import 'package:flutter/material.dart';

import '../../../core/theme/color_manager.dart';
import '../../../domain/profile/entities/profile_entity.dart';
import '../../settings/views/settings_view.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: ColorManager.primaryGradient,
          ),
          child: Center(
            child: Text(
              profile.name.isNotEmpty
                  ? profile.name[0].toUpperCase()
                  : "U",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                profile.email,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SettingsView(),
              ),
            );
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}