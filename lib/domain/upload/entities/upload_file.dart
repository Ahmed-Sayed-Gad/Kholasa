class UploadFile {
  final String name;
  final String path;
  final int sizeInBytes;
  final String extension;
  final bool isValid;
  final String? errorMessage;

  const UploadFile({
    required this.name,
    required this.path,
    required this.sizeInBytes,
    required this.extension,
    this.isValid = true,
    this.errorMessage,
  });

  UploadFile copyWith({
    bool? isValid,
    String? errorMessage,
  }) {
    return UploadFile(
      name: name,
      path: path,
      sizeInBytes: sizeInBytes,
      extension: extension,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
