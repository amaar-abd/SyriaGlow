import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';
import 'package:syria_glow/features/ai_chat/presentation/manager/ai_chat/ai_chat_cubit.dart';
import 'package:syria_glow/features/ai_chat/presentation/widgets/ai_chat_view_body.dart';

class AiChatView extends StatelessWidget {
  const AiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withAlpha(40),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                Assets.assetsImagesChatAI,
                height: 25.r,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryGreen,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.hurAiAssistant,
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  context.l10n.hurSubtitle,
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    color: AppColors.textGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocProvider.value(
        value: sl.get<AiChatCubit>()
          ..initConversation(context.l10n.hurWelcomeMessage),
        child: const AiChatViewBody(),
      ),
    );
  }
}
