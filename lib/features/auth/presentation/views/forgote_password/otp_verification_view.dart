import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/custom_snackbar.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:syria_glow/features/auth/presentation/widgets/auth_appbar.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key, required this.email});
  final String email;
  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.primaryGreen),
      ),
    );
    return Scaffold(
      appBar: authAppBar(context, showButton: true),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccess) {
            Navigator.pushNamed(context, AppRoutes.resetPasswordView);
          } else if (state is VerifyCodeError) {
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
                      context.l10n.verificationTitle,
                      style: context.textTheme.displayMedium?.copyWith(
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text.rich(
                      TextSpan(
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textDark,
                        ),
                        children: [
                          TextSpan(text: '${context.l10n.verificationDesc} '),
                          TextSpan(
                            text: widget.email,
                            style: const TextStyle(
                              color: AppColors.elegantGold,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.center,
                      child: Pinput(
                        length: 6,
                        controller: _otpController,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        showCursor: true,

                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return context.l10n.enterFullCode;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    MainButton(
                      onPressed: state is VerifyCodeLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<ForgotPasswordCubit>()
                                    .verifyResetCode(code: _otpController.text);
                              }
                            },
                      widget: state is VerifyCodeLoading
                          ? CircularProgressIndicator(
                              color: AppColors.backgroundLight,
                              strokeWidth: 3,
                            )
                          : null,
                      text: state is VerifyCodeLoading
                          ? ''
                          : context.l10n.confirmCode,
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
