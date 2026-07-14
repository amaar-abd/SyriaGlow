import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/custom_snackbar.dart';
import 'package:syria_glow/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';

void showSignOutDialog(BuildContext context, LogoutCubit signoutCubit) {
  showDialog(
    context: context,
    builder: (context) => BlocProvider.value(
      value: signoutCubit,
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
        if (state is LogoutSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.loginView,
                        (route) => true,
                      );
                    }
                  if (state is LogoutError) {
                    customSnackBar(context, state.message, AppColors.error);
                  }
        },
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: AppColors.surfaceWhite,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.logout_title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                    fontSize: 18,
                  ),
                ),
                 SizedBox(width: 8.w),
                const Icon(
                  Icons.logout_outlined,
                  color: AppColors.error,
                  size: 22,
                ),
              ],
            ),

            content: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                context.l10n.logout_confirmation,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textGray,
                  height: 1.6,
                ),
              ),
            ),

            actions: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child:  Text(
                        context.l10n.cancel,
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                                    color: AppColors.textGray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                      ),
                    ),
                  ),
                   SizedBox(width: 8.w),
                  Expanded(
                    flex: 1,
                    child: BlocBuilder<LogoutCubit, LogoutState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.error,
                            foregroundColor: AppColors.surfaceWhite,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: state is LogoutLoading
                              ? null
                              : () => context.read<LogoutCubit>().logout(),
                          child: state is LogoutLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              :  Text(
                                  context.l10n.logout,
                                  style: TextTheme.of(context).bodyMedium?.copyWith(
                                    color: AppColors.surfaceWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ),
  );
}
