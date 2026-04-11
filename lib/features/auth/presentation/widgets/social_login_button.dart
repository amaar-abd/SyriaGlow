import 'package:flutter/material.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.onpressed,
    required this.title,
    required this.widget,
  });
  final Widget widget;
  final VoidCallback onpressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            overlayColor: AppColors.primaryGreenLight,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: AppColors.primaryGreen),
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
          onPressed: onpressed,
          child: ListTile(
            visualDensity: VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            title: Text(
              textAlign: TextAlign.center,
              title,
              style: TextTheme.of(
                context,
              ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            leading: widget,
          ),
        ),
      ),
    );
  }
}
