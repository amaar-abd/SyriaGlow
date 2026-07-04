import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class EmptyNotificationsView extends StatelessWidget {
  const EmptyNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              decoration:BoxDecoration(
              color: AppColors.primaryGreen.withAlpha(10),
              shape: BoxShape.circle,
            ),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 80.r,
                color: AppColors.elegantGold.withAlpha(110),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'لا توجد إشعارات حالياً',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'هنا سنرسل لك أحدث الفعاليات، وتوصيات الأماكن والأنشطة السياحية المميزة فور توفرها.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textGray,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
