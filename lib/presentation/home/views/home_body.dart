import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui_models/recent_item_ui_model.dart';
import '../../widget/reduced_font_theme.dart';
import '../../widget/sections/home_upload_actions_section.dart';
import '../cubit/home_cubit.dart';
import '../../widget/search_bar/home_search_bar..dart';
import '../../widget/sections/home_recent_section.dart';
import '../../widget/sections/home_sliver_app_bar.dart';
import '../../widget/states/home_error_state.dart';
import '../cubit/home_cubit_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ReducedFontTheme(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(child: CircularProgressIndicator());
          }


          if (state is HomeError) {
            return HomeErrorState(
              message: state.message,
              onRetry: () {
                context.read<HomeCubit>().loadHome();
              },
            );
          }

          if (state is HomeSuccess || state is HomeEmpty) {

            final items =
            state is HomeSuccess
                ? state.items
                : <RecentItemUiModel>[];

            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
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

                  const SliverToBoxAdapter(
                    child: UploadActionsSection(),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.only(top: 24),
                    sliver: HomeRecentSection(
                      items: items,
                    ),
                  ),
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
