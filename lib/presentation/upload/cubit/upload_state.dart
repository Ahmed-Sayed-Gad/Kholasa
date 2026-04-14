import 'dart:io';

sealed class UploadState {
  const UploadState();
}

class UploadIdle extends UploadState {
  const UploadIdle();
}

class UploadLoading extends UploadState {
  const UploadLoading();
}

class UploadSuccess extends UploadState {
  final File file;

  const UploadSuccess(this.file);
}

class UploadFailure extends UploadState {
  final String message;

  const UploadFailure(this.message);
}
