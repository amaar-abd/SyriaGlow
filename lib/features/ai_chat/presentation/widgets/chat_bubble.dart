import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/ai_chat/domain/entities/message_entity.dart';

class ChatBubble extends StatelessWidget {
  final MessageEntity message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;
    final formattedTime = DateFormat('hh:mm a').format(message.timestamp);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.78.sw),
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.primaryGreen
              : AppColors.textGray.withAlpha(150),
          border: isUser
              ? null
              : Border.all(
                  color: AppColors.goldSoft.withAlpha(120),
                  width: 0.8,
                ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(isUser ? 16.r : 4.r),
            bottomRight: Radius.circular(isUser ? 4.r : 16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(6),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          runSpacing: 2.h, 
          spacing: 8.w,
          children: [
            SelectableText(
              message.text,
              style: TextStyle(
                color: isUser ? AppColors.surfaceWhite : AppColors.textDark,
                fontSize: 14.sp,
                height: 1.45,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              formattedTime,
              style: TextStyle(
                color: isUser
                    ? AppColors.goldSoft.withAlpha(200)
                    : AppColors.textGray,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
