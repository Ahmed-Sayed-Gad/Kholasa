import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ScanMlKitDataSource {
  Future<String> extractText(File image) async {
    final inputImage = InputImage.fromFile(image);

    final recognizer = TextRecognizer();

    final result = await recognizer.processImage(inputImage);

    await recognizer.close();

    return result.text;
  }
}