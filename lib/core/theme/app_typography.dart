import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class AppTypography {
  static final TextStyle headline1 = GoogleFonts.cairo(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryGreen,
    height: 1.4,
  );

  static final TextStyle headline2 = GoogleFonts.cairo(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryGreen,
    height: 1.3,
  );

  static final TextStyle bodyText1 = GoogleFonts.cairo(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
    height: 1.6,
  );
  static final TextStyle bodyText2 = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
    height: 1.6,
  );

  static final TextStyle bodyText3 = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textGray,
    height: 1.5,
  );

  static final TextStyle buttonLabel = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.surfaceWhite,
  );

  static final TextStyle caption = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.elegantGold,
  );

  static final TextStyle inputField = GoogleFonts.cairo(
    fontSize: 16,
    color: AppColors.primaryGreen,
  );
}
