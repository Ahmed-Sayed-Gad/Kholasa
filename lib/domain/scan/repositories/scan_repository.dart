import 'dart:io';

abstract class ScanRepository {
  Future<String> extractText(File image);
}