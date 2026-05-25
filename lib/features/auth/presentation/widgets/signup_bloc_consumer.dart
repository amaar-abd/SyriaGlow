import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/custom_snackbar.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/presentation/manager/register_cubit/register_cubit.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({
    super.key,
    required GlobalKey<FormState> globalKey,
    required this.passwordController,
    required this.passwordConfirmationController,
    required this.nameController,
    required this.emailController,
    required this.onValidations,
  }) : _globalKey = globalKey;

  final GlobalKey<FormState> _globalKey;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final VoidCallback onValidations;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          customSnackBar(
            context,
            state.authResponse.message,
            AppColors.success,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.mainLayoutView,
            (route) => false,
          );
        }
        if (state is RegisterError) {
          customSnackBar(context, state.error, AppColors.error);
        }
      },
      builder: (context, state) {
        final bool isLoading = state is RegisterLoading;
        return MainButton(
          onPressed: isLoading
              ? null
              : () {
                  if (_globalKey.currentState!.validate()) {
                    if (passwordController.text ==
                        passwordConfirmationController.text) {
                      context.read<RegisterCubit>().registerAccount(
                        registerRequest: RegisterRequest(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConf: passwordConfirmationController.text,
                        ),
                      );
                    } else {
                      customSnackBar(
                        context,
                        context.l10n.passwordValidationError,
                        AppColors.error,
                      );
                    }
                  } else {
                    onValidations();
                  }
                },
          text: isLoading ? null : context.l10n.signUpButton,
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
