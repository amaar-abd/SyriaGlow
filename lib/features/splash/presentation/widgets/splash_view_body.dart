import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syria_glow/core/helpers/spacing.dart';
import 'package:syria_glow/core/manager/routing_cubit/routing_cubit.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoutingCubit, RoutingState>(
      listener: (context, state) {
        if (state is NavigateToOnboarding) {
          Navigator.pushReplacementNamed(context, AppRoutes.onboardingView);
        } else if (state is NavigateToLogin) {
          Navigator.pushReplacementNamed(context, AppRoutes.loginView);
        } else if (state is NavigateToHome) {
          Navigator.pushReplacementNamed(context, AppRoutes.mainLayoutView);
        }
      },
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              Assets.assetsImagesAleppoAtNight,
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
      ),
    );
  }
}
