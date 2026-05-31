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

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(context, showButton: true),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Navigator.pushNamed(context, AppRoutes.successResetPasswordViw);
          } else if (state is ResetPasswordError) {
            customSnackBar(context, state.message, AppColors.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      context.l10n.resetPasswordTitle,
                      style: context.textTheme.displayMedium?.copyWith(
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      context.l10n.resetPasswordDesc,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      hintText: context.l10n.passwordHint,
                      title: context.l10n.passwordTitle,
                      controller: _passwordController,
                      obscureText: isObscure,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      hintText: context.l10n.passwordConfirmationHint,
                      title: context.l10n.passwordConfirmationTitle,
                      controller: _passwordConfirmationController,
                      obscureText: isObscure,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    MainButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_passwordController.text !=
                              _passwordConfirmationController.text) {
                            customSnackBar(
                              context,
                              context.l10n.passwordValidationError,
                              AppColors.error,
                            );
                            return;
                          }
                          context.read<ForgotPasswordCubit>().resetPassword(
                            password: _passwordController.text,
                            confirmPassword:
                                _passwordConfirmationController.text,
                          );
                        }
                      },
                      widget: state is ResetPasswordLoading
                          ? CircularProgressIndicator(
                              color: AppColors.backgroundLight,
                              strokeWidth: 3,
                            )
                          : null,
                      text: state is ResetPasswordLoading
                          ? ''
                          : context.l10n.updatePasswordBtn,
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
