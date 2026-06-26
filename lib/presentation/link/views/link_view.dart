import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/reduced_font_theme.dart';

import '../cubit/link_cubit.dart';
import '../cubit/link_state.dart';

import '../widgets/link_card.dart';
import '../widgets/link_error_view.dart';
import '../widgets/link_idle_view.dart';
import '../widgets/link_loading_view.dart';
import '../../../../l10n/app_localizations.dart';

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
      return SingleChildScrollView(
        child: Column(
          children: [
            const Icon(
              Icons.summarize,
              size: 50,
            ),

            const SizedBox(height: 16),

            Text(
              state.summary,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                context
                    .read<LinkCubit>()
                    .reset();
              },
              child: Text(
                AppLocalizations.of(context)!.summarizeAnotherUrl,
              ),
            ),
          ],
        ),
      );
    }
    return LinkIdleView(
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReducedFontTheme(
      child: Scaffold(
      backgroundColor:
      Theme.of(context)
          .scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:
        Theme.of(context)
            .scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.pasteLink,
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
    ),);
  }
}