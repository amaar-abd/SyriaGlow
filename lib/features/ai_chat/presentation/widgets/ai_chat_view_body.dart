import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/custom_snackbar.dart';
import 'package:syria_glow/features/ai_chat/presentation/manager/ai_chat/ai_chat_cubit.dart';
import 'package:syria_glow/features/ai_chat/presentation/manager/ai_chat/ai_chat_state.dart';
import 'package:syria_glow/features/ai_chat/presentation/widgets/chat_bubble.dart';
import 'package:syria_glow/features/ai_chat/presentation/widgets/chat_input_field.dart';

class AiChatViewBody extends StatefulWidget {
  const AiChatViewBody({super.key});

  @override
  State<AiChatViewBody> createState() => _AiChatViewBodyState();
}

class _AiChatViewBodyState extends State<AiChatViewBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocConsumer<AiChatCubit, AiChatState>(
            listener: (context, state) {
              _scrollToBottom();
              if (state is AiChatFailure) {
                customSnackBar(context, state.message, AppColors.error);
              }
            },
            builder: (context, state) {
              return ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  final message = state.messages[index];
                  return ChatBubble(message: message);
                },
              );
            },
          ),
        ),
        BlocBuilder<AiChatCubit, AiChatState>(
          builder: (context, state) {
            if (state is AiChatLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                child: Row(
                  children: [
                    const SpinKitThreeBounce(
                      color: AppColors.primaryGreen,
                      size: 14.0,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      context.l10n.hurTyping,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textGray,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),

        ChatInputField(
          controller: _controller,
          onSend: () {
            final text = _controller.text;
            if (text.trim().isNotEmpty) {
              _controller.clear();
              context.read<AiChatCubit>().sendUserMessage(text);
              FocusScope.of(context).unfocus();
            }
            
          },
        ),
      ],
    );
  }
}
