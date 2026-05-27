import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/features/auth/domain/use_cases/login_use_case.dart';
import 'package:syria_glow/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:syria_glow/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:syria_glow/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(sl.get<LoginUseCase>()),
          child: LoginViewBody(),
        ),
      ),
      appBar: authAppBar(context),
    );
  }
}
