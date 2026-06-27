import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../services/notification_manager.dart';
import '../../Data/export/repositories_impl/export_repository_impl.dart';
import '../../Data/history/models/history_model.dart';
import '../../Data/quiz/models/quiz_attempt_model.dart';
import '../../Data/notification/models/notification_model.dart';
import '../../Data/history/repositories_impl/history_repository_impl.dart';
import '../../Data/upload/data_sources/file_picker_data_source.dart';
import '../../Data/upload/upload_repository_impl.dart';
import '../../api/api_client.dart';
import '../../domain/export/repositories/export_repository.dart';
import '../../domain/export/use_case/export_summary_use_case.dart';
import '../../domain/history/repositories/history_repository.dart';
import '../../domain/history/use_cases/get_history_use_case.dart';
import '../../domain/history/use_cases/delete_item_use_case.dart';
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
  DeleteItemUseCase deleteItemUseCase(HistoryRepository repo) =>
      DeleteItemUseCase(repo);

  @factory
  HistoryCubit historyCubit(
      GetHistoryUseCase getHistoryUseCase,
      ToggleSavedUseCase toggleSavedUseCase,
      DeleteItemUseCase deleteItemUseCase,
      NotificationManager notificationManager,
      ) =>
      HistoryCubit(getHistoryUseCase, toggleSavedUseCase, deleteItemUseCase, notificationManager);
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

@module
abstract class QuizAttemptModule {
  @preResolve
  Future<Box<QuizAttemptModel>> quizAttemptBox() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(QuizAttemptModelAdapter());
    }
    return await Hive.openBox<QuizAttemptModel>('quizAttemptBox');
  }
}

@module
abstract class NotificationBoxModule {
  @preResolve
  Future<Box<NotificationModel>> notificationBox() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(NotificationModelAdapter());
    }
    return await Hive.openBox<NotificationModel>('notificationBox');
  }
}