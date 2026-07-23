import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/build_feature_card.dart';

class AssistantViewBdoy extends StatelessWidget {
  const AssistantViewBdoy({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.assistant_tools_title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 20.h),
          BuildFeatureCard(
            title: context.l10n.emergency_numbers_title,
            subtitle: context.l10n.emergency_numbers_subtitle,
            icon: Icons.local_phone_rounded,
            iconColor: Colors.red.shade700,
            color: AppColors.primaryGreen.withAlpha(100),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.emergencyView);
            },
          ),
          SizedBox(height: 16.h),
          BuildFeatureCard(
            title: context.l10n.weather_title,
            subtitle: context.l10n.weather_subtitle,
            icon: Icons.wb_sunny_rounded,
            color: AppColors.primaryGreen.withAlpha(100),
            iconColor: Colors.blue.shade700,
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.weatherView);
             
            },
          ),
          SizedBox(height: 16.h),
          BuildFeatureCard(
            title: context.l10n.currency_converter_title,
            subtitle: context.l10n.currency_converter_subtitle,
            icon: Icons.currency_exchange_rounded,
            iconColor: Colors.amber.shade800,
            color: AppColors.primaryGreen.withAlpha(220),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.currencyConverterView);
            },
          ),
          
        ],
      ),
    );
  }
}
