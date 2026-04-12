import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                Assets.assetsImagesPalmyraSyria,
                width: double.infinity,
                height: 390,
                fit: BoxFit.cover,
              ),
            ),
            SkipButton(),
          ],
        ),
        SizedBox(height: 40),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.elegantGold,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.assetsImagesContainer),
                SizedBox(width: 5),
                Text(
                  'التراث الحضاري',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.primaryGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 22),
        Text(
          'تراث يمتد لآلاف السنين',
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(color: AppColors.primaryGreen),
        ),
        SizedBox(height: 22),
        SizedBox(
          width: MediaQuery.of(context).size.width * .90,
          child: Text(
            'اكتشف أسرار الماضي في كل زاوية، من الأسواق القديمة إلى القلاع الحصينة، حيث يروي كل حجر قصة حضارة عظيمة.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryGreen),
          ),
        ),
        SizedBox(height: 22),
        DotsIndicator(
          dotsCount: 2,
          position: pageIndex.toDouble(),
          decorator: DotsDecorator(
            size: const Size(25.0, 8.0),
            activeColor: AppColors.elegantGold,
            activeSize: const Size(25.0, 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        Spacer(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
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
                  'التالي',
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    color: AppColors.surfaceWhite,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: AppColors.surfaceWhite,
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 60),
      ],
    );
  }
}
