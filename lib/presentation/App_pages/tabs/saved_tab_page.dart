import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../notification/cubit/notification_cubit.dart';
import '../../notification/cubit/saved_cubit.dart';
import '../../notification/view/notification_center_view.dart';
import '../../history/cubit/history_cubit.dart';
import '../../history/cubit/history_state.dart';

class SavedTabPage extends StatelessWidget {
  const SavedTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<NotificationCubit>()..loadNotifications(),
        ),
        BlocProvider(
          create: (_) => getIt<SavedCubit>()..loadSavedItems(),
        ),
      ],
      child: BlocListener<HistoryCubit, HistoryState>(
        listener: (context, state) {
          if (state is HistoryLoaded) {
            context.read<SavedCubit>().loadSavedItems();
          }
        },
        child: const NotificationCenterView(),
      ),
    );
  }
}
