import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

void handleSend(BuildContext context) {
    if (controller.text.trim().isNotEmpty) {
      FocusScope.of(context).unfocus(); 
      onSend(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        bottom: !isKeyboardOpen,
        child: Row(
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: AppColors.primaryGreen,
                    selectionHandleColor: AppColors.elegantGold,
                  ),
                ),
                child: TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 4,
                  cursorColor: AppColors.primaryGreen,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => handleSend(context),
                  style: TextStyle(fontSize: 12.sp, color: AppColors.textDark),
                  decoration: InputDecoration(
                    hintText: context.l10n.typeMessageHint,
                    hintStyle: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.textGray,
                    ),
                    fillColor: AppColors.backgroundLight,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(
                        color: AppColors.goldSoft.withAlpha(100),
                        width: 0.8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: const BorderSide(
                        color: AppColors.primaryGreen,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),

            Material(
              color: AppColors.primaryGreen,
              shape: const CircleBorder(),
              elevation: 1,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onSend,
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: const Icon(
                    Icons.send_rounded,
                    color: AppColors.surfaceWhite,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
