import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_stats_section.dart';
import '../widgets/activity_summary_card.dart';
import '../widgets/achievement_section.dart';
import '../../widget/reduced_font_theme.dart';
import '../../../../l10n/app_localizations.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>()..loadProfile(),
      child: ReducedFontTheme(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
  
            if (state is ProfileError) {
              return Center(
                child: Text(state.message),
              );
            }
  
            if (state is ProfileLoaded) {
              final profile = state.profile;
  
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    ProfileHeader(
                      profile: profile,
                    ),
  
                    const SizedBox(height: 24),
  
                    // const PremiumCard(),
  
                    const SizedBox(height: 24),
  
                    ProfileStatsSection(
                      profile: profile,
                    ),
                    const SizedBox(height: 24),
  
                    ActivitySummaryCard(
                      profile: profile,
                    ),
  
                    const SizedBox(height: 12),
  
                    ActivitySummaryCard(
                      profile: profile,
                    ),
                    const SizedBox(height: 24),
  
                    Text(
                      AppLocalizations.of(context)!.achievements,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
  
                    const SizedBox(height: 12),
  
                    const AchievementSection(),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    ),);
  }
}