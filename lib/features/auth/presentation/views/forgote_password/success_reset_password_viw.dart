import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/auth/presentation/widgets/auth_appbar.dart';

class SuccessResetPasswordViw extends StatefulWidget {
  const SuccessResetPasswordViw({super.key});

  @override
  State<SuccessResetPasswordViw> createState() =>
      _SuccessResetPasswordViwState();
}

class _SuccessResetPasswordViwState extends State<SuccessResetPasswordViw>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/Checked.json',
              repeat: false,
              controller: _animationController,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(['**'], value: AppColors.elegantGold),
                ],
              ),
              onLoaded: (composition) {
                _animationController.duration = composition.duration;
                _animationController.animateTo(48 / 63);
              },
            ),

            Text(
              context.l10n.passwordUpdatedSuccess,
              style: context.textTheme.displayMedium?.copyWith(
                color: AppColors.primaryGreen,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              context.l10n.loginNowDesc,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 15.h),
            MainButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginView,
                  (route) => false,
                );
              },
              text: context.l10n.backToLogin,
            ),
          ],
        ),
      ),
    );
  }
}
