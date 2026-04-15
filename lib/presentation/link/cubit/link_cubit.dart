// lib/presentation/link/cubit/link_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'link_state.dart';

@injectable
class LinkCubit extends Cubit<LinkState> {
  LinkCubit() : super(LinkInitial());

  Future<void> submitLink(String url) async {
    final value = url.trim();

    if (value.isEmpty) {
      emit(LinkFailure('Please paste a link'));
      return;
    }

    final isValid =
        value.startsWith('http://') || value.startsWith('https://');

    if (!isValid) {
      emit(LinkFailure('Invalid URL'));
      return;
    }

    emit(LinkLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(LinkSuccess(value));
  }

  void reset() {
    emit(LinkInitial());
  }
}