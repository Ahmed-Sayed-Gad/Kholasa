import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/upload/entities/upload_file.dart';
import 'upload_session_state.dart';

@lazySingleton
class UploadSessionCubit extends Cubit<UploadSessionState> {
  UploadSessionCubit() : super(UploadSessionEmpty());

  void saveFile(UploadFile file) {
    emit(UploadSessionHasFile(file));
  }

  void clear() {
    emit(UploadSessionEmpty());
  }
}
