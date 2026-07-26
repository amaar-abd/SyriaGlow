import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/Constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/services/shared_preferences_service.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class UserInformationColumn extends StatelessWidget {
  const UserInformationColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: context.l10n.welcome,
                    style: context.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: sl<SharedPreferencesService>().getString(
                      AppConstants.username,
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.elegantGold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text('  👋', style: TextStyle(fontSize: 16.r))
                .animate()
                .rotate(
                  begin: -0.04,
                  end: 0.02,
                  duration: 600.ms,
                  curve: Curves.easeInOut,
                )
                .slideX(
                  begin: -0.05,
                  end: 0.05,
                  duration: 600.ms,
                  curve: Curves.easeInOut,
                ),
          ],
        ),
        SizedBox(height: 2.h),
        Text(
          context.l10n.welcomeToSyria,
          style: context.textTheme.displayMedium?.copyWith(
            color: AppColors.primaryGreen,
          ),
        ),
      ],
    );
  }
}
