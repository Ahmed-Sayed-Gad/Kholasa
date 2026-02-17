import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/home_cubit.dart';
import '../../widget/search_bar/home_search_bar..dart';
import '../../widget/sections/home_banner_section.dart';
import '../../widget/sections/home_recent_section.dart';
import '../../widget/sections/home_sliver_app_bar.dart';
import '../../widget/states/home_empty_state.dart';
import '../../widget/states/home_error_state.dart';
import '../cubit/home_cubit_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeEmpty) {
            return const HomeEmptyState();
          }

          if (state is HomeError) {
            return HomeErrorState(
              message: state.message,
              onRetry: () {
                context.read<HomeCubit>().loadHome();
              },
            );
          }

          if (state is HomeSuccess) {
            return Container(
              color: ColorManager.primaryDark,
              child: CustomScrollView(
                slivers: [
                  const HomeSliverAppBar(),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: HomeSearchBar(
                        onChanged: (q) {
                          context.read<HomeCubit>().search(q);
                        },
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.only(top: 16),
                    sliver: HomeBannerSection(
                      banners: state.banners,
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.only(top: 24),
                    sliver: HomeRecentSection(
                      items: state.items,
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
