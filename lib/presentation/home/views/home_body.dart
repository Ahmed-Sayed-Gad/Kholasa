import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';
import '../../chat/cubit/chat_cubit.dart';
import '../../chat/views/chat_view.dart';
import '../../widget/sections/home_upload_actions_section.dart';
import '../cubit/home_cubit.dart';
import '../../widget/search_bar/home_search_bar..dart';
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(.35),
              blurRadius: 18,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor:
          Theme.of(context).colorScheme.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => getIt<ChatCubit>(),
                  child: const ChatView(),
                ),
              ),
            );
          },
          child: const Icon(Icons.chat_outlined),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading ||
              state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HomeEmpty) {
            return const HomeEmptyState();
          }

          if (state is HomeError) {
            return HomeErrorState(
              message: state.message,
              onRetry: () {
                context
                    .read<HomeCubit>()
                    .loadHome();
              },
            );
          }

          if (state is HomeSuccess) {
            return Container(
              color: Theme.of(context)
                  .scaffoldBackgroundColor,
              child: CustomScrollView(
                slivers: [
                  const HomeSliverAppBar(),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(
                          top: 16),
                      child: HomeSearchBar(
                        onChanged: (q) {
                          context
                              .read<HomeCubit>()
                              .search(q);
                        },
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child:
                    UploadActionsSection(),
                  ),

                  SliverPadding(
                    padding:
                    const EdgeInsets.only(
                        top: 24),
                    sliver:
                    HomeRecentSection(
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