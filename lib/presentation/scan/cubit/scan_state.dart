// lib/presentation/scan/cubit/scan_state.dart

sealed class ScanState {}

class ScanInitial extends ScanState {}

class ScanLoading extends ScanState {}

class ScanSuccess extends ScanState {}

class ScanFailure extends ScanState {
  final String message;

  ScanFailure(this.message);
}