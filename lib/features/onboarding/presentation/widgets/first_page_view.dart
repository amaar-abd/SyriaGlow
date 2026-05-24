import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/onboarding/presentation/widgets/skip_button.dart';

class FirstPageView extends StatelessWidget {
  const FirstPageView({
    super.key,
    required this.pageController,
    required this.pageIndex,
  });
  final PageController pageController;
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
              child: Image.asset(
                Assets.assetsImagesPalmyraSyria,
                width: double.infinity,
                height: 350.h,
                fit: BoxFit.cover,
              ),
            ),
            SkipButton(),
          ],
        ),
        SizedBox(height: 20.h),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.onboardingTitle1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.primaryGreen,
                    ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: context.width * .90,
                child: Text(
                  context.l10n.onboardingDesc1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primaryGreen,
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        DotsIndicator(
          dotsCount: 2,
          position: pageIndex.toDouble(),
          decorator: DotsDecorator(
            size: Size(25.0.w, 8.0.h),
            activeColor: AppColors.elegantGold,
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
            onPressed: () {
              pageController.animateToPage(
                1,
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
            },
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.nextButton,
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
