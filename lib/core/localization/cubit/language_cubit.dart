import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/localization/cubit/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial(const Locale('ar')));

  void toggleLanguage() {
    if (state.locale.languageCode == 'ar') {
      emit(LanguageChange(Locale('en')));
    } else {
      emit(LanguageChange(Locale('ar')));
    }
  }
}
