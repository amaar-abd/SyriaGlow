import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class DetailsInfoSection extends StatelessWidget {
  const DetailsInfoSection({super.key, required this.landmark});
  final Landmark landmark;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(color: Colors.white),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategory(textTheme),
          SizedBox(height: 12.h),
          Text(
            landmark.nameAr,
            style: textTheme.displayMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),

          SizedBox(height: 14.h),
          _buildInfoCard(
            textTheme: textTheme,
            icon: Icons.location_on_rounded,
            text: landmark.address,
          ),
          SizedBox(height: 20.h),
          Divider(color: Colors.grey.shade200),
          SizedBox(height: 20.h),
          Text(
            "عن المكان",
            style: textTheme.displayMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            landmark.descAr,
            style: textTheme.bodyMedium?.copyWith(
              height: 1.8,
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (landmark.workingHours.isNotEmpty) ...[
            SizedBox(height: 25.h),
            Divider(color: Colors.grey.shade200),
            SizedBox(height: 20.h),

            Text(
              "أوقات العمل",
              style: textTheme.displayMedium?.copyWith(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12.h),

            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: List.generate(landmark.workingHours.length, (index) {
                  final hour = landmark.workingHours[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hour.day,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.elegantGold.withAlpha(
                              38,
                            ), 
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "${hour.openTime} - ${hour.closeTime}",
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.elegantGold,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],

          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildCategory(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.elegantGold.withAlpha(51),
            AppColors.elegantGold.withAlpha(13),
          ],
        ),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.elegantGold.withAlpha(102)),
      ),
      child: Text(
        landmark.category.nameAr,
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.primaryGreen,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required TextTheme textTheme,
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withAlpha(20),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.elegantGold, size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade800,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
