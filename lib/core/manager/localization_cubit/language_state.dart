import 'package:flutter/material.dart';

sealed class LanguageState {
  final Locale locale;
  const LanguageState(this.locale);
}

final class LanguageInitial extends LanguageState {
  LanguageInitial(super.locale);
}

final class LanguageChange extends LanguageState {
  LanguageChange(super.locale);
}
