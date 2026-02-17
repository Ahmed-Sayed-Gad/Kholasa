import 'package:file_picker/file_picker.dart';
import '../../../domain/upload/entities/upload_file.dart';

class FilePickerDataSource {
  Future<UploadFile> pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      throw Exception('No file selected');
    }

    final file = result.files.single;

    return UploadFile(
      name: file.name,
      path: file.path!, // ⭐ مهم
      sizeInBytes: file.size,
      extension: file.extension?.toLowerCase() ?? '',
    );
  }
}
