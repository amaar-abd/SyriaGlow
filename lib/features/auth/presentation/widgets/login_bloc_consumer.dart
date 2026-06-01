import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/services/secure_storage_service.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/custom_snackbar.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/presentation/manager/login_cubit/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({
    super.key,
    required GlobalKey<FormState> globalKey,
    required this.emailController,
    required this.passwordController,
    required this.onValidations,
  }) : _globalKey = globalKey;

  final GlobalKey<FormState> _globalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onValidations;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          customSnackBar(
            context,
            state.authResponse.message,
            AppColors.primaryGreenLight,
          );
          await sl<SecureStorageService>().write(
            AppConstants.authToken,
            state.authResponse.token,
          );

          if (context.mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.mainLayoutView,
              (route) => false,
            );
          }
        }
        if (state is LoginError) {
          if (context.mounted) {
            customSnackBar(context, state.error, AppColors.error);
          }
        }
      },
      builder: (context, state) {
        final bool isLoading = state is LoginLoading;
        return MainButton(
          onPressed: isLoading
              ? null
              : () {
                  if (_globalKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                      LoginRequest(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  } else {
                    onValidations();
                  }
                },
          text: isLoading ? null : context.l10n.loginButton,
          widget: isLoading
              ? CircularProgressIndicator(
                  color: AppColors.backgroundLight,
                  strokeWidth: 3,
                )
              : null,
        );
      },
    );
  }
}
