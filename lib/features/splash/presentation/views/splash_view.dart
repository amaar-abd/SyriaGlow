import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/manager/routing_cubit/routing_cubit.dart';
import 'package:syria_glow/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,

        body: BlocProvider(
          create: (context) => RoutingCubit()..checkRouting(),
          child: const SplashViewBody(),
        ),
      ),
    );
  }
}
