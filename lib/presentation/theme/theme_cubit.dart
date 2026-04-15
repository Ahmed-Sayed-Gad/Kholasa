import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.dark));

  void toggleTheme() {
    if (state.mode == ThemeMode.dark) {
      emit(const ThemeState(ThemeMode.light));
    } else {
      emit(const ThemeState(ThemeMode.dark));
    }
  }
}