import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/manager/localization_cubit/language_cubit.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.read<LanguageCubit>().toggleLanguage();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0x3300421B),
              ),
              child: SizedBox(
                width: 85.w,
                height: 32.h,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.language,
                        color: AppColors.surfaceWhite,
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        isArabic ? 'English' : 'العربية',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.surfaceWhite,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.loginView);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0x3300421B),
              ),
              child: SizedBox(
                width: 60.w,
                height: 32.h,
                child: Center(
                  child: Text(
                    isArabic ? 'تخطي' : 'Skip',
                    style: TextTheme.of(context).bodySmall?.copyWith(
                      color: AppColors.surfaceWhite,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
