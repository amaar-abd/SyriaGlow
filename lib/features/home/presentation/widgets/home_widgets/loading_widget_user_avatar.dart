
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class LoadingWidgetUserAvatar extends StatelessWidget {
  const LoadingWidgetUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: AppColors.elegantGold,
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: AppColors.surfaceWhite,
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: CircularProgressIndicator(
            color: AppColors.primaryGreen,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
