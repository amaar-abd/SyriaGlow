import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/features/auth/domain/use_cases/register_use_case.dart';
import 'package:syria_glow/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:syria_glow/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:syria_glow/features/auth/presentation/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => RegisterCubit(sl.get<RegisterUseCase>()),
          child: SignupViewBody(),
        ),
      ),
      appBar: authAppBar(context, showButton: true),
    );
  }
}
