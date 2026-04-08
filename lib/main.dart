import 'package:flutter/material.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/routes/route_generator.dart';
import 'package:syria_glow/core/theme/app_theme.dart';

void main() {
  runApp(const SyriaGlow());
}

class SyriaGlow extends StatelessWidget {
  const SyriaGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syria Glow',
      theme: AppTheme.mainTheme,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: AppRoutes.splashView,
      debugShowCheckedModeBanner: false,
    );
  }
}
