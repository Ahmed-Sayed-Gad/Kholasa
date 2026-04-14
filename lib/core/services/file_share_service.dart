import 'package:share_plus/share_plus.dart';
import 'package:open_filex/open_filex.dart';

class FileShareService {
  Future<void> shareFile(String path) async {
    await Share.shareXFiles(
      [XFile(path)],
      text: "Summary generated from the app",
    );
  }

  Future<void> openFile(String path) async {
    await OpenFilex.open(path);
  }
}