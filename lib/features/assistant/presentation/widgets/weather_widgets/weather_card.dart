import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/assistant/data/models/weather_model.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/weather_widgets/weather_info_tile.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weatherInfo});
  final WeatherModel weatherInfo;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: EdgeInsets.all(22.w),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryGreen, AppColors.primaryGreenLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withAlpha(100),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weatherInfo.cityName,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.surfaceWhite,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    weatherInfo.conditionText,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.goldSoft,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                '${weatherInfo.currentTemp}°C',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.surfaceWhite,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(25),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherInfoTile(
                  icon: Icons.water_drop_outlined,
                  title: l10n.humidity,
                  value: '${weatherInfo.humidity}%',
                ),
                Container(width: 1.w, height: 26.h, color: Colors.white24),
                WeatherInfoTile(
                  icon: Icons.air_rounded,
                  title: l10n.wind,
                  value: '${weatherInfo.windKph} ${l10n.kmh}',
                ),
              ],
            ),
          ),

          if (weatherInfo.currentTemp.toString().isNotEmpty) ...[
            SizedBox(height: 18.h),
            Divider(color: Colors.white.withAlpha(100), thickness: 1),
            SizedBox(height: 12.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: const BoxDecoration(
                    color: AppColors.goldSoft,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lightbulb_rounded,
                    color: AppColors.primaryGreen,
                    size: 18.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    weatherInfo.currentTemp.toString(),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.surfaceWhite,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
