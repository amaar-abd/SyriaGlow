import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/utils/app_images.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/auth/presentation/widgets/custom_text_form_field.dart';
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
                'استكشف عبق التاريخ بلمسة عصرية',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                title: 'البريد الإلكتروني',
                hintText: 'abdamaar64@gmail.com',
                controller: emailController,
                obscureText: false,
                suffixIcon: Icon(Icons.email),
              ),
              CustomTextFormField(
                title: 'كلمةالمرور',
                hintText: '********',
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
                  ),
                ),
              ),
              UserQuestionRow(answer: 'هل نسيت كلمة المرور ؟'),
              SizedBox(height: 20),
              MainButton(onPressed: () {}, text: 'تسجيل الدخول'),
              SizedBox(height: 15),
              Ordivider(),
              SizedBox(height: 15),
              SocialLoginButton(
                onpressed: () {},
                title: 'المتابعة كضيف',
                widget: FaIcon(FontAwesomeIcons.user, size: 22),
              ),
              SizedBox(height: 50),
              UserQuestionRow(
                onTap: () {},
                mainAxisAlignment: MainAxisAlignment.center,
                ask: 'لا تمتلك حساب ؟ ',
                answer: 'قم بإنشاء حساب',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
