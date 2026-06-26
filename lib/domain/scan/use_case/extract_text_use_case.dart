import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../repositories/scan_repository.dart';

@injectable
class ExtractTextUseCase {
  final ScanRepository repository;

  ExtractTextUseCase(this.repository);

  Future<Result<String>> call(File image) {
    return repository.extractText(image);
  }
}