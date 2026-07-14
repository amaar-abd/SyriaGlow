import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/profile/presentation/widgets/show_image_bottom_sheet.dart';
import 'package:syria_glow/features/profile/presentation/widgets/show_image_popup.dart';

class ProfileAvatarSection extends StatelessWidget {
  final bool isUploading;
  final String? imageUrl;

  const ProfileAvatarSection({
    super.key,
    required this.isUploading,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.r),
              bottomRight: Radius.circular(32.r),
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              InkWell(
          onTap: () {
    if (!isUploading) {
      showImagePopup(context, imageUrl);
    }},
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: AppColors.elegantGold,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundColor: AppColors.surfaceWhite,
                    child: ClipOval(
                      child: isUploading
                          ? CircularProgressIndicator(
                              color: AppColors.primaryGreen,
                              strokeWidth: 3.w,
                            )
                          : imageUrl != null
                          ? CachedNetworkImage(
                              imageUrl: imageUrl!,
                              width: 120.w,
                              height: 120.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => CircleAvatar(
                                radius: 60.r,
                                backgroundColor: AppColors.surfaceWhite,
                                child: ClipOval(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryGreen,
                                    strokeWidth: 3.w,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                size: 60.r,
                                color: AppColors.primaryGreen,
                              ),
                            )
                          : Icon(
                              Icons.person,
                              size: 60.r,
                              color: AppColors.primaryGreen,
                            ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showImageSourceBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: const BoxDecoration(
                    color: AppColors.elegantGold,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 20.r,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
