import '../entities/upload_file.dart';

abstract class UploadRepository {
  Future<UploadFile> pickFile();
}
