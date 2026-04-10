import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/onboarding/presentation/widgets/skip_button.dart';

class SecondPageView extends StatelessWidget {
  const SecondPageView({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            Assets.assetsImagesDamascusBackground,
            fit: BoxFit.cover,
          ),
        ),
        SkipButton(),
        Positioned(
          top: MediaQuery.of(context).size.height * .50,
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'عبق التاريخ',

                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.surfaceWhite,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'في كل زاوية',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.elegantGold,
                  ),
                ),

                SizedBox(height: 22),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .90,
                  child: Text(
                    'استكشف أزقة دمشق القديمة، حيث تروي\nالجدران حكايا آلاف السنين وتفوح رائحة الياسمين\nمن البيوت الدمشقية العتيقة والأسواق النابضة\nبالحياة.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.surfaceWhite,
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Center(
                  child: DotsIndicator(
                    dotsCount: 2,
                    position: pageIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: AppColors.elegantGold,
                      activeColor: AppColors.elegantGold,
                      size: const Size(25.0, 8.0),
                      activeSize: const Size(25.0, 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: MainButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.loginView);
                    },

                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ابدأ الرحلة',
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
            ),
          ),
        ),
      ],
    );
  }
}
