import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  static const _key = 'app_language';
  final SharedPreferences _prefs;

  LanguageCubit(this._prefs)
      : super(LanguageState(
          Locale(_prefs.getString(_key) ?? 'en'),
        ));

  void changeLanguage(String code) {
    _prefs.setString(_key, code);
    emit(LanguageState(Locale(code)));
  }
}