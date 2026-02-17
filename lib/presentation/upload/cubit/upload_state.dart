import '../../../domain/upload/entities/upload_file.dart';

sealed class UploadState {}

class UploadIdle extends UploadState {}

class UploadPicking extends UploadState {}

class UploadReady extends UploadState {
  final UploadFile file;
  UploadReady(this.file);
}

class UploadUploading extends UploadState {
  final double progress;
  UploadUploading(this.progress);
}

class UploadSuccess extends UploadState {}

class UploadFailure extends UploadState {
  final String message;
  UploadFailure(this.message);
}
