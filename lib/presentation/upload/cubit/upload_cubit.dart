import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/upload/usecases/pick_and_validate_file_usecase.dart';
import 'upload_state.dart';
@injectable
class UploadCubit extends Cubit<UploadState> {
  final PickAndValidateFileUseCase useCase;

  UploadCubit(this.useCase) : super(UploadIdle());

  Future<void> pickFile() async {
    emit(UploadPicking());

    try {
      final file = await useCase.execute();

      if (!file.isValid) {
        emit(UploadFailure(file.errorMessage ?? 'Invalid file'));
        return;
      }

      emit(UploadReady(file));
    } catch (_) {
      emit(UploadFailure('Failed to pick file'));
    }
  }

  void reset() => emit(UploadIdle());
}
