import 'package:flutter/material.dart';
import 'package:syria_glow/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:syria_glow/features/auth/presentation/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SignupViewBody()),
      appBar: authAppBar(context, showButton: true),
    );
  }
}
