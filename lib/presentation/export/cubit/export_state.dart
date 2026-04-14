import '../../../domain/export/models/export_file.dart';

abstract class ExportState {}

class ExportInitial extends ExportState {}

class ExportLoading extends ExportState {}

class ExportSuccess extends ExportState {
  final ExportFile file;

  ExportSuccess(this.file);
}

class ExportError extends ExportState {
  final String message;

  ExportError(this.message);
}