import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';

import 'package:syria_glow/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:syria_glow/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          context.l10n.profile,
          style: TextTheme.of(context).bodyLarge?.copyWith(
                color: AppColors.backgroundLight,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value:   sl<LogoutCubit>()),
          BlocProvider.value(value:   sl<ProfileCubit>()),
        ],
        child: ProfileViewBody(),
      ),
    );
  }
}
