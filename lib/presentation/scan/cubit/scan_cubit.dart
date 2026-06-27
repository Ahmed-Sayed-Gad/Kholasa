import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domain/scan/use_case/extract_text_use_case.dart';
import 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  final ExtractTextUseCase extractTextUseCase;

  ScanCubit(this.extractTextUseCase)
      : super(ScanInitial());

  final picker = ImagePicker();

  Future<void> scanImage(ImageSource source) async {
    try {
      final picked = await picker.pickImage(
        source: source,
      );

      if (picked == null) return;

      // Crop the image before extracting text
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: picked.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Document',
            toolbarColor: const Color(0xFF0F172A),
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: const Color(0xFF22D3EE),
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Document',
          ),
        ],
      );

      if (croppedFile == null) {
        emit(ScanInitial());
        return;
      }

      emit(ScanLoading());

      final file = File(croppedFile.path);

      final result = await extractTextUseCase(file);

      result.fold(
        onSuccess: (text) {
          emit(
            ScanSuccess(
              image: file,
              text: text,
            ),
          );
        },
        onFailure: (failure) {
          emit(
            ScanFailure(
              failure.userFriendlyMessage,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        ScanFailure(
          'Failed to scan image',
        ),
      );
    }
  }

  void reset() {
    emit(ScanInitial());
  }
}