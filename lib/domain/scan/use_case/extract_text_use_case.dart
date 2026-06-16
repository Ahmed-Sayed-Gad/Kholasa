import 'dart:io';

import 'package:injectable/injectable.dart';

import '../repositories/scan_repository.dart';

@injectable
class ExtractTextUseCase {
  final ScanRepository repository;

  ExtractTextUseCase(this.repository);

  Future<String> call(File image) {
    return repository.extractText(image);
  }
}