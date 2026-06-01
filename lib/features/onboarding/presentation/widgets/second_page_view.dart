import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/Constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/services/shared_preferences_service.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/onboarding/presentation/widgets/skip_button.dart';

class SecondPageView extends StatelessWidget {
  const SecondPageView({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Image.asset(
                Assets.assetsImagesAlHisnCastel,
                width: double.infinity,
                height: 340.h,
                fit: BoxFit.cover,
              ),
            ),
            SkipButton(),
          ],
        ),
        SizedBox(height: 20.h),

        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.onboardingTitle2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.primaryGreen,
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: context.width * .90,
                  child: Text(
                    context.l10n.onboardingDesc2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        DotsIndicator(
          dotsCount: 2,
          position: pageIndex.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.elegantGold,
            activeColor: AppColors.elegantGold,
            size: Size(25.0.w, 8.0.h),
            activeSize: Size(25.0.w, 8.0.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.r),
            ),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.r),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: MainButton(
            onPressed: ()async {
              Navigator.of(context).pushNamed(AppRoutes.loginView);
           await   sl.get<SharedPreferencesService>().setBool(
                AppConstants.isOnboardingCompleted,
                true,
              );
            },
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.startJourneyButton,
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    color: AppColors.surfaceWhite,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                FaIcon(
                  isArabic
                      ? FontAwesomeIcons.arrowLeft
                      : FontAwesomeIcons.arrowRight,
                  color: AppColors.surfaceWhite,
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 25.h),
      ],
    );
  }
}
