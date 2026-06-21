import 'package:flutter/material.dart';
import 'package:syria_glow/generated/l10n.dart';

extension ContextExtensions on BuildContext {
  S get l10n => S.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return l10n.requiredField(l10n.emailTitle);
    }
    final String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final RegExp regex = RegExp(pattern);
    
    if (!regex.hasMatch(value)) {
      return l10n.invalidEmail;
    }
    
    return null; 
  }

  String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return l10n.requiredField(l10n.passwordTitle); 
  }

  if (value.length < 8) {
    return l10n.passwordLengthError; 
  }

  return null; 
}
}
