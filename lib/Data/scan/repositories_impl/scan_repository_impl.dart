import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../domain/scan/repositories/scan_repository.dart';
import '../data_source/scan_mlkit_data_source.dart';

@LazySingleton(as: ScanRepository)
class ScanRepositoryImpl implements ScanRepository {
  final ScanMlKitDataSource dataSource;

  ScanRepositoryImpl(this.dataSource);

  @override
  Future<String> extractText(File image) {
    return dataSource.extractText(image);
  }
}