import '../../domain/upload/entities/upload_file.dart';
import '../../domain/upload/repositories/upload_repository.dart';
import 'data_sources/file_picker_data_source.dart';

class UploadRepositoryImpl implements UploadRepository {
  final FilePickerDataSource dataSource;

  UploadRepositoryImpl(this.dataSource);

  @override
  Future<UploadFile> pickFile() {
    return dataSource.pickFile();
  }
}
