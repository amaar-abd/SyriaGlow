import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';
import 'package:syria_glow/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:syria_glow/features/auth/presentation/widgets/login_bloc_consumer.dart';
import 'package:syria_glow/features/auth/presentation/widgets/or_divider.dart';
import 'package:syria_glow/features/auth/presentation/widgets/social_login_button.dart';
import 'package:syria_glow/features/auth/presentation/widgets/user_question_row.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: _globalKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.27,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),

                  child: Image.asset(
                    Assets.assetsImagesLogoApp,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                textAlign: TextAlign.center,
                context.l10n.loginSubtitle,
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                title: context.l10n.emailTitle,
                hintText: context.l10n.emailHint,
                controller: emailController,
                obscureText: false,
                suffixIcon: Icon(Icons.email, color: AppColors.primaryGreen),
              ),
              CustomTextFormField(
                title: context.l10n.passwordTitle,
                hintText: context.l10n.passwordHint,
                controller: passwordController,
                obscureText: isObscure,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure ? Icons.visibility_off : Icons.remove_red_eye,
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
              UserQuestionRow(answer: context.l10n.forgotPassword),
              SizedBox(height: 20),
              LoginBlocConsumer(
                globalKey: _globalKey,
                emailController: emailController,
                passwordController: passwordController,
                onValidations: () {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                },
              ),
              SizedBox(height: 15),
              Ordivider(),
              SizedBox(height: 15),
              SocialLoginButton(
                onpressed: () {
                  Navigator.pushNamed(context, AppRoutes.mainLayoutView);
                },
                title: context.l10n.continueAsGuest,

                leading: const FaIcon(FontAwesomeIcons.user, size: 22),
              ),
              SizedBox(height: 50),
              UserQuestionRow(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.signupView);
                },
                mainAxisAlignment: MainAxisAlignment.center,
                ask: context.l10n.dontHaveAccount,
                answer: context.l10n.signUpNow,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
