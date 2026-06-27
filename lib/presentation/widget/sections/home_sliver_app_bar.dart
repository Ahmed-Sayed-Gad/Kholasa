import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme_cubit.dart';
import '../../theme/theme_state.dart';
import '../../App_pages/home_shell_page.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,

      leading: const Padding(
        padding: EdgeInsets.all(7),
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/Logo.jpg',
          ),
        ),
      ),

      actions: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final isDark =
                state.mode == ThemeMode.dark;

            return Container(
              margin:
              const EdgeInsets.only(
                right: 8,
              ),
              decoration: BoxDecoration(
                color:
                Theme.of(context)
                    .cardColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  context
                      .read<ThemeCubit>()
                      .toggleTheme();
                },
                icon: Icon(
                  isDark
                      ? Icons
                      .light_mode_outlined
                      : Icons
                      .dark_mode_outlined,
                  color:
                  Theme.of(context)
                      .iconTheme
                      .color,
                ),
              ),
            );
          },
        ),

        Container(
          margin:
          const EdgeInsets.only(
            right: 8,
          ),
          decoration: BoxDecoration(
            color:
            Theme.of(context)
                .cardColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.notifications_none,
              color:
              Theme.of(context)
                  .iconTheme
                  .color,
            ),
            onPressed: () {
              HomeShellPage.tabNotifier.value = 2; // Navigate to Saved / Notifications Tab
            },
          ),
        ),
      ],
    );
  }
}