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

  /// `Explore the fragrance of history`
  String get loginSubtitle {
    return Intl.message(
      'Explore the fragrance of history',
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

  /// `About the place`
  String get aboutPlace {
    return Intl.message(
      'About the place',
      name: 'aboutPlace',
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

  /// `Services`
  String get nav_services {
    return Intl.message('Services', name: 'nav_services', desc: '', args: []);
  }

  /// `Profile`
  String get nav_profile {
    return Intl.message('Profile', name: 'nav_profile', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `View on in-app map`
  String get showOnInAppMap {
    return Intl.message(
      'View on in-app map',
      name: 'showOnInAppMap',
      desc: '',
      args: [],
    );
  }

  /// `Direct route navigation`
  String get directRouteGuidance {
    return Intl.message(
      'Direct route navigation',
      name: 'directRouteGuidance',
      desc: '',
      args: [],
    );
  }

  /// `There are currently no landmarks in this category`
  String get noLandmarksInCategory {
    return Intl.message(
      'There are currently no landmarks in this category',
      name: 'noLandmarksInCategory',
      desc: '',
      args: [],
    );
  }

  /// `Search for places, events, or exhibitions`
  String get searchPlaceholder {
    return Intl.message(
      'Search for places, events, or exhibitions',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Trending exhibitions and events`
  String get trendingEventsAndExhibitions {
    return Intl.message(
      'Trending exhibitions and events',
      name: 'trendingEventsAndExhibitions',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, no results found`
  String get noResultsFound {
    return Intl.message(
      'Sorry, no results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Make sure the words are spelled correctly`
  String get checkSpelling {
    return Intl.message(
      'Make sure the words are spelled correctly',
      name: 'checkSpelling',
      desc: '',
      args: [],
    );
  }

  /// `View current events`
  String get showCurrentEvents {
    return Intl.message(
      'View current events',
      name: 'showCurrentEvents',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message('Distance', name: 'distance', desc: '', args: []);
  }

  /// `Estimated time`
  String get estimatedTime {
    return Intl.message(
      'Estimated time',
      name: 'estimatedTime',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Guest`
  String get guest_name {
    return Intl.message('Guest', name: 'guest_name', desc: '', args: []);
  }

  /// `Log in to access all features`
  String get guest_email {
    return Intl.message(
      'Log in to access all features',
      name: 'guest_email',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorite {
    return Intl.message('Favorites', name: 'favorite', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications at the moment`
  String get no_notifications {
    return Intl.message(
      'No notifications at the moment',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Here, we will send you the latest events, recommended places, and top tourist activities as soon as they become available.`
  String get notifications_empty_desc {
    return Intl.message(
      'Here, we will send you the latest events, recommended places, and top tourist activities as soon as they become available.',
      name: 'notifications_empty_desc',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get change_language {
    return Intl.message(
      'Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `About Us`
  String get about_us {
    return Intl.message('About Us', name: 'about_us', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Your favorites list is empty`
  String get favorites_empty_title {
    return Intl.message(
      'Your favorites list is empty',
      name: 'favorites_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Start exploring tourist attractions and add what you like here`
  String get favorites_empty_subtitle {
    return Intl.message(
      'Start exploring tourist attractions and add what you like here',
      name: 'favorites_empty_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile Picture`
  String get profile_image_title {
    return Intl.message(
      'Profile Picture',
      name: 'profile_image_title',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get choose_from_gallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'choose_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Take a Photo with Camera`
  String get take_photo_camera {
    return Intl.message(
      'Take a Photo with Camera',
      name: 'take_photo_camera',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout_title {
    return Intl.message('Logout', name: 'logout_title', desc: '', args: []);
  }

  /// `Are you sure you want to log out of your account?`
  String get logout_confirmation {
    return Intl.message(
      'Are you sure you want to log out of your account?',
      name: 'logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Logout`
  String get logout_button {
    return Intl.message('Logout', name: 'logout_button', desc: '', args: []);
  }

  /// `Useful tools for your journey in Syria`
  String get assistant_tools_title {
    return Intl.message(
      'Useful tools for your journey in Syria',
      name: 'assistant_tools_title',
      desc: '',
      args: [],
    );
  }

  /// `Currency Converter`
  String get currency_converter_title {
    return Intl.message(
      'Currency Converter',
      name: 'currency_converter_title',
      desc: '',
      args: [],
    );
  }

  /// `Calculate foreign currency values against Syrian Pounds directly.`
  String get currency_converter_subtitle {
    return Intl.message(
      'Calculate foreign currency values against Syrian Pounds directly.',
      name: 'currency_converter_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Weather Conditions`
  String get weather_title {
    return Intl.message(
      'Weather Conditions',
      name: 'weather_title',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Days Forecast`
  String get weekly_forecast {
    return Intl.message(
      'Upcoming Days Forecast',
      name: 'weekly_forecast',
      desc: '',
      args: [],
    );
  }

  /// `Select your governorate from 14 Syrian governorates to check current weather and tips.`
  String get weather_subtitle {
    return Intl.message(
      'Select your governorate from 14 Syrian governorates to check current weather and tips.',
      name: 'weather_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Numbers`
  String get emergency_numbers_title {
    return Intl.message(
      'Emergency Numbers',
      name: 'emergency_numbers_title',
      desc: '',
      args: [],
    );
  }

  /// `Quick and direct speed dial directory for rescue and emergency services with one tap.`
  String get emergency_numbers_subtitle {
    return Intl.message(
      'Quick and direct speed dial directory for rescue and emergency services with one tap.',
      name: 'emergency_numbers_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Amount in foreign currency`
  String get amount_foreign_currency {
    return Intl.message(
      'Amount in foreign currency',
      name: 'amount_foreign_currency',
      desc: '',
      args: [],
    );
  }

  /// `Amount in SYP`
  String get amount_syp {
    return Intl.message(
      'Amount in SYP',
      name: 'amount_syp',
      desc: '',
      args: [],
    );
  }

  /// `Approximate value in SYP`
  String get approx_value_syp {
    return Intl.message(
      'Approximate value in SYP',
      name: 'approx_value_syp',
      desc: '',
      args: [],
    );
  }

  /// `Approximate value in `
  String get approx_value_in {
    return Intl.message(
      'Approximate value in ',
      name: 'approx_value_in',
      desc: '',
      args: [],
    );
  }

  /// `SYP`
  String get syp {
    return Intl.message('SYP', name: 'syp', desc: '', args: []);
  }

  /// `Humidity`
  String get humidity {
    return Intl.message('Humidity', name: 'humidity', desc: '', args: []);
  }

  /// `Wind`
  String get wind {
    return Intl.message('Wind', name: 'wind', desc: '', args: []);
  }

  /// `km/h`
  String get kmh {
    return Intl.message('km/h', name: 'kmh', desc: '', args: []);
  }

  /// `Damascus`
  String get damascus {
    return Intl.message('Damascus', name: 'damascus', desc: '', args: []);
  }

  /// `Rif Dimashq`
  String get rif_dimashq {
    return Intl.message('Rif Dimashq', name: 'rif_dimashq', desc: '', args: []);
  }

  /// `Aleppo`
  String get aleppo {
    return Intl.message('Aleppo', name: 'aleppo', desc: '', args: []);
  }

  /// `Homs`
  String get homs {
    return Intl.message('Homs', name: 'homs', desc: '', args: []);
  }

  /// `Hama`
  String get hama {
    return Intl.message('Hama', name: 'hama', desc: '', args: []);
  }

  /// `Latakia`
  String get latakia {
    return Intl.message('Latakia', name: 'latakia', desc: '', args: []);
  }

  /// `Tartous`
  String get tartous {
    return Intl.message('Tartous', name: 'tartous', desc: '', args: []);
  }

  /// `Idlib`
  String get idlib {
    return Intl.message('Idlib', name: 'idlib', desc: '', args: []);
  }

  /// `Sweida`
  String get sweida {
    return Intl.message('Sweida', name: 'sweida', desc: '', args: []);
  }

  /// `Daraa`
  String get daraa {
    return Intl.message('Daraa', name: 'daraa', desc: '', args: []);
  }

  /// `Quneitra`
  String get quneitra {
    return Intl.message('Quneitra', name: 'quneitra', desc: '', args: []);
  }

  /// `Deir ez-Zor`
  String get deir_ez_zor {
    return Intl.message('Deir ez-Zor', name: 'deir_ez_zor', desc: '', args: []);
  }

  /// `Raqqa`
  String get raqqa {
    return Intl.message('Raqqa', name: 'raqqa', desc: '', args: []);
  }

  /// `Hasakah`
  String get hasakah {
    return Intl.message('Hasakah', name: 'hasakah', desc: '', args: []);
  }

  /// `Emergency Ambulance Service`
  String get emergency_ambulance_title {
    return Intl.message(
      'Emergency Ambulance Service',
      name: 'emergency_ambulance_title',
      desc: '',
      args: [],
    );
  }

  /// `For medical emergencies and critical cases`
  String get emergency_ambulance_desc {
    return Intl.message(
      'For medical emergencies and critical cases',
      name: 'emergency_ambulance_desc',
      desc: '',
      args: [],
    );
  }

  /// `Traffic Police`
  String get emergency_traffic_police_title {
    return Intl.message(
      'Traffic Police',
      name: 'emergency_traffic_police_title',
      desc: '',
      args: [],
    );
  }

  /// `To report accidents and manage traffic flow`
  String get emergency_traffic_police_desc {
    return Intl.message(
      'To report accidents and manage traffic flow',
      name: 'emergency_traffic_police_desc',
      desc: '',
      args: [],
    );
  }

  /// `Highway Patrol`
  String get emergency_highway_patrol_title {
    return Intl.message(
      'Highway Patrol',
      name: 'emergency_highway_patrol_title',
      desc: '',
      args: [],
    );
  }

  /// `For emergencies on intercity highways`
  String get emergency_highway_patrol_desc {
    return Intl.message(
      'For emergencies on intercity highways',
      name: 'emergency_highway_patrol_desc',
      desc: '',
      args: [],
    );
  }

  /// `Fire & Civil Defense`
  String get emergency_fire_defense_title {
    return Intl.message(
      'Fire & Civil Defense',
      name: 'emergency_fire_defense_title',
      desc: '',
      args: [],
    );
  }

  /// `For fires and major rescue operations`
  String get emergency_fire_defense_desc {
    return Intl.message(
      'For fires and major rescue operations',
      name: 'emergency_fire_defense_desc',
      desc: '',
      args: [],
    );
  }

  /// `Tourist Police`
  String get emergency_tourist_police_title {
    return Intl.message(
      'Tourist Police',
      name: 'emergency_tourist_police_title',
      desc: '',
      args: [],
    );
  }

  /// `To assist, guide, and support tourists`
  String get emergency_tourist_police_desc {
    return Intl.message(
      'To assist, guide, and support tourists',
      name: 'emergency_tourist_police_desc',
      desc: '',
      args: [],
    );
  }

  /// `Ministry of Tourism Complaints`
  String get emergency_tourism_complaints_title {
    return Intl.message(
      'Ministry of Tourism Complaints',
      name: 'emergency_tourism_complaints_title',
      desc: '',
      args: [],
    );
  }

  /// `To receive feedback and visitor inquiries`
  String get emergency_tourism_complaints_desc {
    return Intl.message(
      'To receive feedback and visitor inquiries',
      name: 'emergency_tourism_complaints_desc',
      desc: '',
      args: [],
    );
  }

  /// `Criminal Security & Police`
  String get emergency_public_police_title {
    return Intl.message(
      'Criminal Security & Police',
      name: 'emergency_public_police_title',
      desc: '',
      args: [],
    );
  }

  /// `For general reports and security issues`
  String get emergency_public_police_desc {
    return Intl.message(
      'For general reports and security issues',
      name: 'emergency_public_police_desc',
      desc: '',
      args: [],
    );
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
