// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Explore the fragrance of history with a modern touch`
  String get loginSubtitle {
    return Intl.message(
      'Explore the fragrance of history with a modern touch',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailTitle {
    return Intl.message(
      'Email Address',
      name: 'emailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordTitle {
    return Intl.message('Password', name: 'passwordTitle', desc: '', args: []);
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get passwordConfirmationTitle {
    return Intl.message(
      'Confirm Password',
      name: 'passwordConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get passwordConfirmationHint {
    return Intl.message(
      'Re-enter your password',
      name: 'passwordConfirmationHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Continue as a guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as a guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get signUpNow {
    return Intl.message(
      'Create an account',
      name: 'signUpNow',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullNameTitle {
    return Intl.message('Full Name', name: 'fullNameTitle', desc: '', args: []);
  }

  /// `Enter your triple name`
  String get fullNameHint {
    return Intl.message(
      'Enter your triple name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpButton {
    return Intl.message('Sign Up', name: 'signUpButton', desc: '', args: []);
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginText {
    return Intl.message('Login', name: 'loginText', desc: '', args: []);
  }

  /// `Please accept the terms and conditions `
  String get acceptTermsAndConditionsError {
    return Intl.message(
      'Please accept the terms and conditions ',
      name: 'acceptTermsAndConditionsError',
      desc: '',
      args: [],
    );
  }

  /// `Password too short (min 8 chars)`
  String get passwordLengthError {
    return Intl.message(
      'Password too short (min 8 chars)',
      name: 'passwordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Cultural Heritage`
  String get culturalHeritage {
    return Intl.message(
      'Cultural Heritage',
      name: 'culturalHeritage',
      desc: '',
      args: [],
    );
  }

  /// `Heritage extending for thousands of years`
  String get onboardingTitle1 {
    return Intl.message(
      'Heritage extending for thousands of years',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover ancient markets, majestic castles, and the secrets of a great civilization in every corner.`
  String get onboardingDesc1 {
    return Intl.message(
      'Discover ancient markets, majestic castles, and the secrets of a great civilization in every corner.',
      name: 'onboardingDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextButton {
    return Intl.message('Next', name: 'nextButton', desc: '', args: []);
  }

  /// `Discover history treasures`
  String get onboardingTitle2 {
    return Intl.message(
      'Discover history treasures',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Embark on a journey through time, exploring ancient heritage blended with modern innovation.`
  String get onboardingDesc2 {
    return Intl.message(
      'Embark on a journey through time, exploring ancient heritage blended with modern innovation.',
      name: 'onboardingDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Start Journey`
  String get startJourneyButton {
    return Intl.message(
      'Start Journey',
      name: 'startJourneyButton',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get loginOr {
    return Intl.message('Or', name: 'loginOr', desc: '', args: []);
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordValidationError {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter {fieldName}`
  String requiredField(Object fieldName) {
    return Intl.message(
      'Please enter $fieldName',
      name: 'requiredField',
      desc: '',
      args: [fieldName],
    );
  }

  /// `Enter your email address and we will send you an OTP code to verify your identity.`
  String get forgotPasswordDesc {
    return Intl.message(
      'Enter your email address and we will send you an OTP code to verify your identity.',
      name: 'forgotPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationTitle {
    return Intl.message(
      'Verification Code',
      name: 'verificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a 4-digit verification code to your email`
  String get verificationDesc {
    return Intl.message(
      'We have sent a 4-digit verification code to your email',
      name: 'verificationDesc',
      desc: '',
      args: [],
    );
  }

  /// `Send Verification Code`
  String get sendVerificationCode {
    return Intl.message(
      'Send Verification Code',
      name: 'sendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `confirmCode`
  String get confirmCode {
    return Intl.message('confirmCode', name: 'confirmCode', desc: '', args: []);
  }

  /// `Didn't receive the code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resendCode {
    return Intl.message('Resend', name: 'resendCode', desc: '', args: []);
  }

  /// `Reset New Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset New Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new strong password to secure your account`
  String get resetPasswordDesc {
    return Intl.message(
      'Please enter a new strong password to secure your account',
      name: 'resetPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordLabel {
    return Intl.message(
      'New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePasswordBtn {
    return Intl.message(
      'Update Password',
      name: 'updatePasswordBtn',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully `
  String get passwordUpdatedSuccess {
    return Intl.message(
      'Password updated successfully ',
      name: 'passwordUpdatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `You can now log in with your new password`
  String get loginNowDesc {
    return Intl.message(
      'You can now log in with your new password',
      name: 'loginNowDesc',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter The Full Code`
  String get enterFullCode {
    return Intl.message(
      'Please Enter The Full Code',
      name: 'enterFullCode',
      desc: '',
      args: [],
    );
  }

  /// `Discover by Category`
  String get discoverByCategory {
    return Intl.message(
      'Discover by Category',
      name: 'discoverByCategory',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `Welcome `
  String get welcome {
    return Intl.message('Welcome ', name: 'welcome', desc: '', args: []);
  }

  /// `Welcome to Syria`
  String get welcomeToSyria {
    return Intl.message(
      'Welcome to Syria',
      name: 'welcomeToSyria',
      desc: '',
      args: [],
    );
  }

  /// `Most Visited Places`
  String get mostVisitedPlaces {
    return Intl.message(
      'Most Visited Places',
      name: 'mostVisitedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Hotels`
  String get hotels {
    return Intl.message('Hotels', name: 'hotels', desc: '', args: []);
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message('Restaurants', name: 'restaurants', desc: '', args: []);
  }

  /// `Historical `
  String get historicalPlaces {
    return Intl.message(
      'Historical ',
      name: 'historicalPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Nature`
  String get nature {
    return Intl.message('Nature', name: 'nature', desc: '', args: []);
  }

  /// `Airports`
  String get airports {
    return Intl.message('Airports', name: 'airports', desc: '', args: []);
  }

  /// `Religious`
  String get religious {
    return Intl.message('Religious', name: 'religious', desc: '', args: []);
  }

  /// `Home`
  String get nav_home {
    return Intl.message('Home', name: 'nav_home', desc: '', args: []);
  }

  /// `Explore`
  String get nav_explore {
    return Intl.message('Explore', name: 'nav_explore', desc: '', args: []);
  }

  /// `My Trips`
  String get nav_my_trips {
    return Intl.message('My Trips', name: 'nav_my_trips', desc: '', args: []);
  }

  /// `Favorites`
  String get nav_favorites {
    return Intl.message('Favorites', name: 'nav_favorites', desc: '', args: []);
  }

  /// `Profile`
  String get nav_profile {
    return Intl.message('Profile', name: 'nav_profile', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
