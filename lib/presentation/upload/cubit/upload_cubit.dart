import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'upload_state.dart';

@injectable

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(const UploadIdle());

  Future<void> pickFile() async {
    try {
      emit(const UploadLoading());

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result == null) {
        emit(const UploadIdle());
        return;
      }

      final file = File(result.files.single.path!);

      // ⬅️ هنا بنقول: الملف اتاخد خلاص
      emit(UploadSuccess(file));
    } catch (e) {
      emit(const UploadFailure('Failed to pick file'));
    }
  }

  void reset() {
    emit(const UploadIdle());
  } }
