import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/extensions/landmark_localization_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
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
          _buildCategory(textTheme,context),
          SizedBox(height: 12.h),
          Text(
            landmark.name(context),
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
            text: landmark.addr(context),
          ),
          SizedBox(height: 12.h),

          _buildMapActionCard(context, textTheme),
          SizedBox(height: 20.h),
          Divider(color: Colors.grey.shade200),
          SizedBox(height: 20.h),
          Text(
            context.l10n.aboutPlace,
            style: textTheme.displayMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),

          Text(
            landmark.description(context),
            style: textTheme.bodyMedium?.copyWith(
              height: 1.8,
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),
          Divider(color: Colors.grey.shade200, height: 1, thickness: 1),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildCategory(TextTheme textTheme,BuildContext context) {
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
        landmark.category.name(context),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
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

  Widget _buildMapActionCard(BuildContext context, TextTheme textTheme) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.mapLocationView,
              arguments: landmark,
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withAlpha(20),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.map_rounded,
                    color: AppColors.elegantGold,
                    size: 24,
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       context.l10n.directRouteGuidance,
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        context.l10n.showOnInAppMap,
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColors.textGray,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primaryGreen,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
