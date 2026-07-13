import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  const EmptyFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border_rounded,
              size: 60.sp,
              color: AppColors.elegantGold.withAlpha(200),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'قائمتك المفضلة فارغة',
            style: TextTheme.of(context).displayMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            ' باستكشاف المعالم السياحية وأضف ما يعجبك هنا',
            textAlign: TextAlign.center,
            style: TextTheme.of(context).bodyMedium?.copyWith(
              color: AppColors.textGray,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
