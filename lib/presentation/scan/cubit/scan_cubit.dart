// lib/presentation/scan/cubit/scan_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  Future<void> scanImage() async {
    emit(ScanLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(ScanSuccess());
  }

  void reset() {
    emit(ScanInitial());
  }
}