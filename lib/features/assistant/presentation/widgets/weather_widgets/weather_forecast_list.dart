import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/date_formatter.dart';
import 'package:syria_glow/features/assistant/data/models/weather_model.dart';

class WeatherForecastList extends StatelessWidget {
  const WeatherForecastList({
    super.key,
    required this.forecastDays,
    required this.langCode,
  });
  final List<ForecastDayModel> forecastDays;
  final String langCode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: forecastDays.length,
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemBuilder: (context, index) {
          final day = forecastDays[index];
          return Container(
            width: 95.w,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceWhite,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: AppColors.primaryGreen.withAlpha(110)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textDark.withAlpha(12),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDate(day.date, langCode),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withAlpha(10),
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    day.conditionIcon,
                    width: 50.w,
                    height: 50.h,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.wb_sunny_rounded,
                      color: AppColors.elegantGold,
                      size: 30.sp,
                    ),
                  ),
                ),
                Text(
                  '${day.maxTemp.round()}° / ${day.minTemp.round()}°',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
