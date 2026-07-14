import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

void showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (bottomSheetContext) => SafeArea(
        child: Wrap(
          children: [
            Divider(
              color: AppColors.textGray.withAlpha(200),
              thickness: 3.h,
              indent: 155.w,
              radius: BorderRadius.circular(5.r),
              endIndent: 155.w,
            ),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                context.l10n.profile_image_title,
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.elegantGold,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              leading: Icon(
                Icons.photo_library,
                color: AppColors.elegantGold,
                size: 24.r,
              ),
              title: Text(
                context.l10n.choose_from_gallery,
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.textDark,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(bottomSheetContext);
                context.read<ProfileCubit>().pickAndUploadImage(
                  ImageSource.gallery,
                );
              },
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              leading: Icon(
                Icons.camera_alt,
                color: AppColors.elegantGold,
                size: 24.r,
              ),
              title: Text(
                context.l10n.take_photo_camera,
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.textDark,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(bottomSheetContext);
                context.read<ProfileCubit>().pickAndUploadImage(
                  ImageSource.camera,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

