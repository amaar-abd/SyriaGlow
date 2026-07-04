import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class SearchNoResults extends StatelessWidget {
  const SearchNoResults({super.key, this.onClearSearch});
  final VoidCallback? onClearSearch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withAlpha(10),
              shape: BoxShape.circle,
            ),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlassMinus,
              color: AppColors.elegantGold.withAlpha(110),
              size: 60.r,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'عذراً، لم نجد نتائج',
            style: TextTheme.of(context).displayMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'تأكد من كتابة الكلمة بشكل صحيح',
            textAlign: TextAlign.center,
            style: TextTheme.of(
              context,
            ).bodyMedium?.copyWith(color: AppColors.textGray,fontWeight: FontWeight.w500,
                fontSize: 14.sp,),
          ),
          SizedBox(height: 24.h),
          OutlinedButton.icon(
            onPressed: onClearSearch,
            style: OutlinedButton.styleFrom(
              overlayColor: AppColors.primaryGreen.withAlpha(50),
              side: const BorderSide(color: Color(0xFFD4AF37)),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            icon: FaIcon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: const Color(0xFFD4AF37),
              size: 14.r,
            ),
            label: Text(
              'عرض الفعاليات الحالية',
              style: TextTheme.of(context).bodySmall?.copyWith(color: AppColors.elegantGold)
            ),
          ),
        ],
      ),
    );
  }
}
