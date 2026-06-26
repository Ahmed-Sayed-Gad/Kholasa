import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<void> scanImage() async {
    try {
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (picked == null) return;

      emit(ScanLoading());

      final file = File(picked.path);

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