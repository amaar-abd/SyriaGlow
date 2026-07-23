import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/province_name.dart';
import 'package:syria_glow/features/assistant/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:syria_glow/features/assistant/presentation/manager/weather_cubit/weather_state.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/weather_widgets/weather_card.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/weather_widgets/weather_forecast_list.dart';

class WeatherViewBody extends StatefulWidget {
  const WeatherViewBody({super.key});

  @override
  State<WeatherViewBody> createState() => _WeatherViewBodyState();
}

class _WeatherViewBodyState extends State<WeatherViewBody> {
  String selectedProvinceKey = 'damascus';

  final List<String> provincesKeys = const [
    'damascus',
    'Douma, Syria',
    'aleppo',
    'homs',
    'hama',
    'latakia',
    'tartous',
    'idlib',
    'sweida',
    'Deraa, Syria',
    'quneitra',
    'Deir ez-Zor',
    'raqqa, Syria',
    'hasakah',
  ];

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.surfaceWhite,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColors.primaryGreen.withAlpha(150),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textDark.withAlpha(10),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(20.r),
                value: selectedProvinceKey,
                isExpanded: true,
                dropdownColor: AppColors.surfaceWhite,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primaryGreen,
                  size: 26.sp,
                ),
                items: provincesKeys.map((String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(
                      getProvinceName(context, key),
                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newKey) {
                  if (newKey != null && newKey != selectedProvinceKey) {
                    setState(() {
                      selectedProvinceKey = newKey;
                    });
                    context.read<WeatherCubit>().fetchWeather(
                      provinceQuery: selectedProvinceKey,
                      langCode: langCode,
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 24.h),
          BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoadingState) {
                return SizedBox(
                  height: 200.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                );
              } else if (state is WeatherErrorState) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.error.withAlpha(20),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              } else if (state is WeatherSuccessState) {
                return Column(
                  children: [
                    WeatherCard(weatherInfo:state.weather),
                    SizedBox(height: 24.h),
                    if (state.weather.forecastDays.isNotEmpty) ...[
                      Text(
                        context.l10n.weekly_forecast,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      WeatherForecastList(
                        forecastDays: state.weather.forecastDays,
                        langCode: langCode,
                      ),
                    ],
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
