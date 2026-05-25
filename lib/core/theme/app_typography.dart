import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class AppTypography {

  static TextStyle get headline1 => GoogleFonts.cairo(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryGreen,
        height: 1.4,
      );

  static TextStyle get headline2 => GoogleFonts.cairo(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryGreen,
        height: 1.3,
      );

  static TextStyle get bodyText1 => GoogleFonts.cairo(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
        height: 1.6,
      );

  static TextStyle get bodyText2 => GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textDark,
        height: 1.6,
      );

  static TextStyle get bodyText3 => GoogleFonts.cairo(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textGray,
        height: 1.5,
      );

  static TextStyle get buttonLabel => GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.surfaceWhite,
      );

  static TextStyle get caption => GoogleFonts.cairo(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.elegantGold,
      );

  static TextStyle get inputField => GoogleFonts.cairo(
        fontSize: 16.sp,
        color: AppColors.primaryGreen,
      );
}