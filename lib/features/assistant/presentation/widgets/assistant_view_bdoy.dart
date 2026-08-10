import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';
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
            title: context.l10n.ai_chat_title,
            subtitle: context.l10n.ai_chat_subtitle,
            widget: SvgPicture.asset(
              Assets.assetsImagesChatAI,
              height: 30.r,
              colorFilter: ColorFilter.mode(
                AppColors.primaryGreen,
                BlendMode.srcIn,
              ),
            ),
            color: AppColors.primaryGreen.withAlpha(100),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.aiChatView);
            },
          ),
          SizedBox(height: 16.h),
          BuildFeatureCard(
            title: context.l10n.emergency_numbers_title,
            subtitle: context.l10n.emergency_numbers_subtitle,
            widget: Icon(
              Icons.local_phone_rounded,
              color: Colors.red.shade700,
              size: 30.r,
            ),
            color: AppColors.primaryGreen.withAlpha(100),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.emergencyView);
            },
          ),
          SizedBox(height: 16.h),
          BuildFeatureCard(
            title: context.l10n.weather_title,
            subtitle: context.l10n.weather_subtitle,
            widget: Icon(
              Icons.wb_sunny_rounded,
              color: Colors.blue.shade700,
              size: 30.r,
            ),

            color: AppColors.primaryGreen.withAlpha(100),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.weatherView);
            },
          ),
          SizedBox(height: 16.h),
          BuildFeatureCard(
            title: context.l10n.currency_converter_title,
            subtitle: context.l10n.currency_converter_subtitle,
            widget: Icon(
              Icons.currency_exchange_rounded,
              color: Colors.amber.shade800,
              size: 30.r,
            ),
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
