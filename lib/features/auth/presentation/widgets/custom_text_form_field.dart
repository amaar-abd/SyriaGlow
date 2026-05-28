import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // استيراد مكتبة التجاوب
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.title,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
  });
  final String? title;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: TextTheme.of(
            context,
          ).bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        SizedBox(height: 8.h),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade400, blurRadius: 4.r),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.primaryGreen,
                selectionHandleColor: AppColors.primaryGreen,
                selectionColor: AppColors.primaryGreen.withAlpha(30),
              ),
            ),
            child: TextFormField(
              obscureText: obscureText ?? true,
              controller: controller,
              style: TextTheme.of(
                context,
              ).bodyMedium?.copyWith(fontSize: 16.sp),
              validator: (value) => value == null || value.isEmpty
                  ? context.l10n.requiredField(title ?? '')
                  : null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                hintText: hintText,
                hintStyle: TextTheme.of(
                  context,
                ).bodySmall?.copyWith(fontSize: 14.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: AppColors.primaryGreenLight),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: Colors.red),
                ),

                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.h,
                  horizontal: 16.w,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
