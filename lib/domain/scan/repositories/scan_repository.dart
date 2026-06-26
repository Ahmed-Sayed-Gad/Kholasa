import 'dart:io';
import 'package:project_one_c3_team/core/errors/result/results.dart';

abstract class ScanRepository {
  Future<Result<String>> extractText(File image);
}