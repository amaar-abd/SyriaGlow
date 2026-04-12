import 'package:flutter/material.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/features/auth/presentation/views/login_view.dart';
import 'package:syria_glow/features/auth/presentation/views/signup_view.dart';
import 'package:syria_glow/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:syria_glow/features/splash/presentation/views/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) =>const SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (context) =>const OnboardingView());
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (context) =>const LoginView());
      case AppRoutes.signupView:
        return MaterialPageRoute(builder: (context) =>const SignupView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}
