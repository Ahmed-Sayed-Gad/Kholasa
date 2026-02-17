import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../Data/upload/data_sources/file_picker_data_source.dart';
import '../../Data/upload/upload_repository_impl.dart';
import '../../api/Api_Client.dart';
import '../../domain/upload/repositories/upload_repository.dart';
import '../../domain/upload/usecases/pick_and_validate_file_usecase.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: "https://exam.elevateegy.com/api/",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  @lazySingleton
  ApiClient provideApiClient(Dio dio) => ApiClient(dio);

  @lazySingleton
  FlutterSecureStorage get secureStorage =>
      const FlutterSecureStorage();
}
@module
abstract class UploadModule {

  @lazySingleton
  FilePickerDataSource filePickerDataSource() =>
      FilePickerDataSource();

  @lazySingleton
  UploadRepository uploadRepository(
      FilePickerDataSource dataSource,
      ) =>
      UploadRepositoryImpl(dataSource);

  @factory
  PickAndValidateFileUseCase pickAndValidateFileUseCase(
      UploadRepository repository,
      ) =>
      PickAndValidateFileUseCase(repository);
}
