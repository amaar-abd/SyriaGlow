import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class AppTypography {

  static const String _arabicFont = 'Noto Serif Arabic';

  //  Large titles 
  static final TextStyle headline1 = GoogleFonts.getFont(
    _arabicFont,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryGreen,
    height: 1.4,
  );

  // Section headers
  static final TextStyle headline2 = GoogleFonts.getFont(
    _arabicFont,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryGreen,
    height: 1.3,
  );

  // Main content descriptions
  static final TextStyle bodyText1 = GoogleFonts.getFont(
    _arabicFont,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
    height: 1.6,
  );

  //  Muted secondary text
  static final TextStyle bodyText2 = GoogleFonts.getFont(
    _arabicFont,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textGray,
    height: 1.5,
  );

  // Button Label - Text inside primary buttons
  static final TextStyle buttonLabel = GoogleFonts.getFont(
    _arabicFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.surfaceWhite,
  );

  // Caption - Smallest labels and status text
  static final TextStyle caption = GoogleFonts.getFont(
    _arabicFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.elegantGold,
  );

  // TextField Input - For login/signup forms
  static final TextStyle inputField = GoogleFonts.getFont(
    _arabicFont,
    fontSize: 16,
    color: AppColors.primaryGreen,
  );
}