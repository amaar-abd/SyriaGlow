import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syria_glow/core/helpers/spacing.dart';
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
    navigatorToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            Assets.assetsImagesAleppoAtNight2,
            fit: BoxFit.cover,
            color: Colors.black.withAlpha(50),
            colorBlendMode: BlendMode.darken,
          ),
        ),
    
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 25.sp,
                  letterSpacing: 4.w,
                  color: AppColors.surfaceWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
    
              verticalSpace(10.h),
    
              Text(
                'Syria',
                style: GoogleFonts.greatVibes(
                  fontSize: 75.sp,
                  color: AppColors.surfaceWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  navigatorToNextPage() {
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingView);
    });
  }
}
