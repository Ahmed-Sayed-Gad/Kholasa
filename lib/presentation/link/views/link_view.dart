import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/link_cubit.dart';
import '../cubit/link_state.dart';

import '../widgets/link_card.dart';
import '../widgets/link_error_view.dart';
import '../widgets/link_idle_view.dart';
import '../widgets/link_loading_view.dart';

class LinkView extends StatefulWidget {
  const LinkView({super.key});

  @override
  State<LinkView> createState() => _LinkViewState();
}

class _LinkViewState extends State<LinkView> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildBody(LinkState state) {
    if (state is LinkLoading) {
      return const LinkLoadingView();
    }

    if (state is LinkFailure) {
      return LinkErrorView(
        message: state.message,
      );
    }

    if (state is LinkSuccess) {
      return Column(
        children: [
          Icon(
            Icons.check_circle,
            color:
            Theme.of(context).colorScheme.primary,
            size: 52,
          ),
          const SizedBox(height: 16),

          Text(
            'Link Added Successfully',
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            state.url,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              context
                  .read<LinkCubit>()
                  .reset();
            },
            child: const Text(
              'Add Another',
            ),
          ),
        ],
      );
    }

    return LinkIdleView(
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Theme.of(context)
          .scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:
        Theme.of(context)
            .scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Paste Link',
          style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<LinkCubit, LinkState>(
          builder: (context, state) {
            return Center(
              child: LinkCard(
                child: _buildBody(state),
              ),
            );
          },
        ),
      ),
    );
  }
}