import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/main_button.dart';
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
      body: Padding(
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
                    length: 4,
                    controller: _otpController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    showCursor: true,

                    validator: (value) {
                      if (value == null || value.length < 4) {
                        return context.l10n.enterFullCode;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                MainButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //logic backend
                      Navigator.pushNamed(context, AppRoutes.resetPasswordView);
                    }
                  },
                  text: context.l10n.confirmCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
