import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syria_glow/features/onboarding/presentation/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, 
        statusBarIconBrightness: Brightness.dark, 
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(body: SafeArea(child: OnboardingViewBody())));
  }
}
