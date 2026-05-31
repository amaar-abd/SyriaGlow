import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/custom_snackbar.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:syria_glow/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:syria_glow/features/auth/presentation/widgets/custom_text_form_field.dart';

class ForgotePasswordView extends StatefulWidget {
  const ForgotePasswordView({super.key});

  @override
  State<ForgotePasswordView> createState() => _ForgotePasswordViewState();
}

class _ForgotePasswordViewState extends State<ForgotePasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(context, showButton: true),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        
        listener: (context, state) {

          if (state is ForgotPasswordSuccess) {
            Navigator.pushNamed(
              context,
              AppRoutes.otpVerificationView,
              arguments: _emailController.text.trim(),
            );
          } else if (state is ForgotPasswordError) {
            customSnackBar(context, state.message, AppColors.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      context.l10n.forgotPassword,
                      style: context.textTheme.displayMedium?.copyWith(
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      context.l10n.forgotPasswordDesc,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      obscureText: false,
                      hintText: context.l10n.emailHint,
                      title: context.l10n.emailTitle,
                      controller: _emailController,
                      suffixIcon: Icon(
                        Icons.email,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    SizedBox(height: 15.h),

                    MainButton(
                      onPressed: state is ForgotPasswordLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<ForgotPasswordCubit>()
                                    .sendForgotPasswordEmail(
                                      email: _emailController.text,
                                    );
                              }
                            },
                      widget: state is ForgotPasswordLoading
                          ? CircularProgressIndicator(
                              color: AppColors.backgroundLight,
                              strokeWidth: 3,
                            )
                          : null,
                      text: state is ForgotPasswordLoading
                          ? ''
                          : context.l10n.sendVerificationCode,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
