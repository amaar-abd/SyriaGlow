import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({super.key, required this.landmark, this.onTap});
  final Landmark landmark;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final imageUrl = landmark.images.isNotEmpty
        ? landmark.images.first.image
        : '';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // تثبيت العرض ليتناسب مع ربع الشاشة تقريباً أثناء التمرير الأفقي
        width: 150.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1️⃣ الجزء العلوي: الصورة مربعة مع حواف دائرية علوية فقط
            SizedBox(
              height: 110.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[100],
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFD4AF37),
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            ),

            // 2️⃣ الجزء السفلي: محتوى الفعالية والزر
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // العنوان والموقع
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          landmark.nameAr,
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              color: AppColors.primaryGreen,
                              size: 10.r,
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Text(
                                landmark.address,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // زر عرض التفاصيل الأنيق
                    Container(
                      width: double.infinity,
                      height: 26.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          'التفاصيل',
                          style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
