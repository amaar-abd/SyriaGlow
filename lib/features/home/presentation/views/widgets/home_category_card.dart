import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final FaIconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50.r),

            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withAlpha(10),
                border: Border.all(color: AppColors.elegantGold, width: 0.5),
                shape: BoxShape.circle,
              ),
              child: FaIcon(icon, color: AppColors.primaryGreen, size: 25.r),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
