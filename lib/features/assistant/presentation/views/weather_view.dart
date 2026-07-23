import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/assistant/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/weather_widgets/weather_view_body.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.primaryGreen),
        centerTitle: true,
        elevation: 0,
        title: Text(
          context.l10n.weather_title,
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider.value(
        value: sl.get<WeatherCubit>()
          ..fetchWeather(provinceQuery: 'damascus', langCode: langCode),
        child: const WeatherViewBody(),
      ),
    );
  }
}
