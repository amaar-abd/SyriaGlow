import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_cubit.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_state.dart';

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale currentLocale = Localizations.localeOf(context);
    final bool isArabic = currentLocale.languageCode == 'ar';
    return BlocBuilder<UserLocationCubit, UserLocationState>(
      builder: (context, state) {
        if (state is UserLocationLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isArabic
                      ? 'جاري تحديد موقعك الحالي...  '
                      : 'Locating your position...  ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: AppColors.textGray,
                  ),
                ),
                SizedBox(width: 5.w),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withAlpha(20),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: SizedBox(
                    height: 30.r,
                    width: 30.r,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: CircularProgressIndicator(
                        color: AppColors.primaryGreen,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is UserLocationFailure) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isArabic
                      ? 'يرجى تفعيل الموقع  '
                      : ' Please enable location  ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: AppColors.textGray,
                  ),
                ),
                SizedBox(width: 5.w),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withAlpha(20),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Icon(
                      Icons.location_off,
                      color: Colors.red[700],
                      size: 22.r,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        String cityName = '';
        String streetName = '';
        if (state is UserLocationSuccess) {
          List<String> addressParts = state.address.split(',');
          if (addressParts.isNotEmpty) {
            streetName = addressParts[2].trim();
            if (addressParts.length > 1) {
              cityName = addressParts[1].trim();
            }
          } 
          else {
             cityName = state.address;
            streetName = state.address;
          }
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityName,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    streetName,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: AppColors.textGray,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5.w),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withAlpha(20),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Icon(
                    Icons.location_pin,
                    color: AppColors.primaryGreen,
                    size: 22.r,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
