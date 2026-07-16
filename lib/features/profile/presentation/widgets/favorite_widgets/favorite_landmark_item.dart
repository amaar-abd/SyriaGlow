import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/landmark_localization_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';

class FavoriteLandmarkItem extends StatelessWidget {
  const FavoriteLandmarkItem({super.key, required this.landmark});
  final Landmark landmark;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.homeDetailsView, arguments: landmark);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: CachedNetworkImage(
                  imageUrl:  landmark.images.isNotEmpty
                                  ? landmark.images[0].image
                                  : '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.primaryGreen,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFD4AF37),
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.primaryGreen,
                    child: const Icon(
                      Icons.broken_image,
                      color: AppColors.elegantGold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    landmark.name(context),
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<FavoriteCubit>().toggleFavorite(
                  landmarkId: landmark.id.toString(),
                );
              },
              icon: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(20),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.delete_rounded, color: Colors.red, size: 20.sp),
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
