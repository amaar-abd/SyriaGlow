import 'package:flutter/material.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            width: MediaQuery.of(context).size.width * .15,
            height: MediaQuery.of(context).size.height * .04,
            child: Center(
              child: Text(
                'تخطي',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(color: AppColors.surfaceWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
