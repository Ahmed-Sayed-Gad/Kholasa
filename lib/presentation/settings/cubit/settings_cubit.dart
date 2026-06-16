import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/settings/use_case/get_settings_use_case.dart';
import '../../../domain/settings/use_case/update_theme_use_case.dart';
import '../../../domain/settings/use_case/update_notifications_use_case.dart';
import '../../../domain/settings/use_case/update_language_use_case.dart';
import '../../../domain/settings/use_case/update_auto_save_use_case.dart';

import '../../theme/theme_cubit.dart';

import 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final GetSettingsUseCase getSettingsUseCase;

  final UpdateThemeUseCase updateThemeUseCase;

  final UpdateNotificationsUseCase updateNotificationsUseCase;

  final UpdateLanguageUseCase updateLanguageUseCase;

  final UpdateAutoSaveUseCase updateAutoSaveUseCase;

  SettingsCubit(
    this.getSettingsUseCase,
    this.updateThemeUseCase,
    this.updateNotificationsUseCase,
    this.updateLanguageUseCase,
    this.updateAutoSaveUseCase,
  ) : super(SettingsState.initial());

  Future<void> load() async {
    emit(state.copyWith(status: SettingsStatus.loading));

    try {
      final data = await getSettingsUseCase();

      emit(state.copyWith(status: SettingsStatus.loaded, settings: data));
    } catch (e) {
      emit(state.copyWith(status: SettingsStatus.error, message: e.toString()));
    }
  }

  Future<void> toggleTheme(BuildContext context, bool isDark) async {
    await updateThemeUseCase(isDark);

    context.read<ThemeCubit>().setTheme(
      isDark ? ThemeMode.dark : ThemeMode.light,
    );

    await load();
  }

  Future<void> toggleNotifications(bool value) async {
    await updateNotificationsUseCase(value);

    await load();
  }

  Future<void> toggleAutoSave(bool value) async {
    await updateAutoSaveUseCase(value);

    await load();
  }

  Future<void> changeLanguage(String language) async {
    await updateLanguageUseCase(language);

    await load();
  }
}
