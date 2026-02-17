import '../../../domain/upload/entities/upload_file.dart';

sealed class UploadSessionState {}

class UploadSessionEmpty extends UploadSessionState {}

class UploadSessionHasFile extends UploadSessionState {
  final UploadFile file;
  UploadSessionHasFile(this.file);
}
