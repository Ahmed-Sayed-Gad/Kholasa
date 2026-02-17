import '../entities/upload_file.dart';
import '../repositories/upload_repository.dart';

class PickAndValidateFileUseCase {
  final UploadRepository repository;

  PickAndValidateFileUseCase(this.repository);

  Future<UploadFile> execute() async {
    final file = await repository.pickFile();

    if (file.sizeInBytes > 25 * 1024 * 1024) {
      return file.copyWith(
        isValid: false,
        errorMessage: 'File size must be less than 25MB',
      );
    }

    const allowed = ['pdf', 'docx', 'pptx', 'jpg', 'png'];
    if (!allowed.contains(file.extension)) {
      return file.copyWith(
        isValid: false,
        errorMessage: 'Unsupported file type',
      );
    }

    return file;
  }
}
