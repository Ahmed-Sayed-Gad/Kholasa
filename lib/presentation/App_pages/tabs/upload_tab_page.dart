import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/di.dart';
import '../../upload/cubit/upload_cubit.dart';
import '../../upload/views/upload_view.dart';

class UploadTabPage extends StatelessWidget {
  const UploadTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UploadCubit>(),
      child: const UploadView(),
    );
  }
}

