import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../Data/export/repositories_impl/export_repository_impl.dart';
import '../../Data/history/models/history_model.dart';
import '../../Data/history/repositories_impl/history_repository_impl.dart';
import '../../Data/upload/data_sources/file_picker_data_source.dart';
import '../../Data/upload/upload_repository_impl.dart';
import '../../api/api_client.dart';
import '../../domain/export/repositories/export_repository.dart';
import '../../domain/export/use_case/export_summary_use_case.dart';
import '../../domain/history/repositories/history_repository.dart';
import '../../domain/history/use_cases/get_history_use_case.dart';
import '../../domain/history/use_cases/toggle_saved_use_case.dart';
import '../../domain/upload/repositories/upload_repository.dart';
import '../../domain/upload/usecases/pick_and_validate_file_usecase.dart';
import '../../presentation/history/cubit/history_cubit.dart';

@module
abstract class AppModule {
  @lazySingleton
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: "https://moahmmed24-001-site1.ctempurl.com/api/",
      headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
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

@module
@module
abstract class HistoryModule {
  @preResolve
  Future<Box<HistoryModel>> historyBox() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HistoryModelAdapter());
    }

    return await Hive.openBox<HistoryModel>('historyBox');
  }

  @lazySingleton
  HistoryRepository historyRepository(Box<HistoryModel> box) {
    return HistoryRepositoryImpl(box);
  }

  @factory
  GetHistoryUseCase getHistoryUseCase(HistoryRepository repo) =>
      GetHistoryUseCase(repo);

  @factory
  ToggleSavedUseCase toggleSavedUseCase(HistoryRepository repo) =>
      ToggleSavedUseCase(repo);

  @factory
  HistoryCubit historyCubit(
      GetHistoryUseCase getHistoryUseCase,
      ToggleSavedUseCase toggleSavedUseCase,
      ) =>
      HistoryCubit(getHistoryUseCase, toggleSavedUseCase);
}@module
abstract class ExportModule {
  @lazySingleton
  ExportRepository exportRepository() =>
      ExportRepositoryImpl();

  @factory
  ExportSummaryUseCase exportSummaryUseCase(
      ExportRepository repository,
      ) =>
      ExportSummaryUseCase(repository);
}