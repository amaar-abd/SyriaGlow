import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigatorToNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            Assets.assetsImagesAleppoAtNight,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: MediaQuery.sizeOf(context).height * .45,
          left: MediaQuery.sizeOf(context).width * .3,
          child: Text(
            'Syria',
            style: GoogleFonts.greatVibes(
              fontSize: 75,
              color: AppColors.surfaceWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Positioned(
          top: MediaQuery.sizeOf(context).height * .57,

          left: MediaQuery.sizeOf(context).width * .3,
          child: Text(
            'Welcome to',
            style: GoogleFonts.playfairDisplay(
              fontSize: 25,
              letterSpacing: 4,
              color: AppColors.surfaceWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  navigatorToNextPage(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingView);
    });
  }
}
