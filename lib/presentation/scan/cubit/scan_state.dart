import 'dart:io';

sealed class ScanState {}

class ScanInitial extends ScanState {}

class ScanLoading extends ScanState {}

class ScanSuccess extends ScanState {
  final File image;
  final String text;

  ScanSuccess({
    required this.image,
    required this.text,
  });
}

class ScanFailure extends ScanState {
  final String message;

  ScanFailure(this.message);
}