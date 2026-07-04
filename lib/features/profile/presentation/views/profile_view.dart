import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/features/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:syria_glow/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LogoutCubit>(),
      child: ProfileViewBody(),
    );
  }
}
