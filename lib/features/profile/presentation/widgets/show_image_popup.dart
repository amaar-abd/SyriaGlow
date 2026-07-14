import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/profile/presentation/widgets/show_image_bottom_sheet.dart';

void showImagePopup(BuildContext context, String? imageUrl) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent, 
    builder: (dialogContext) {
      return Dialog(
        insetPadding: EdgeInsets.zero, 
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            InteractiveViewer(
              clipBehavior: Clip.none,
              minScale: 1.0, 
              maxScale: 2.0, 
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color:  Colors.black.withAlpha(100),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 400.h, 
                    color: Colors.transparent,
                    child: imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.contain, 
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.elegantGold,
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.person,
                              size: 140.r,
                              color: AppColors.surfaceWhite,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: 140.r,
                            color: AppColors.surfaceWhite,
                          ),
                  ),
                ),
              ),
            ),     
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon:  Icon(Icons.close, color: Colors.white, size: 26.r),
                    onPressed: () => Navigator.pop(dialogContext),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: AppColors.elegantGold, size: 26.r),
                    onPressed: () {
                      Navigator.pop(dialogContext); 
                      showImageSourceBottomSheet(context); 
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}