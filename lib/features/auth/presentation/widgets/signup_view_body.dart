import 'package:flutter/material.dart';
import 'package:syria_glow/core/utils/main_button.dart';
import 'package:syria_glow/features/auth/presentation/widgets/custom_checkbox_list_tile.dart';
import 'package:syria_glow/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:syria_glow/features/auth/presentation/widgets/user_question_row.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
  bool isChecked = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
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
              // Text(
              //   'استكشف عبق التاريخ بلمسة عصرية',
              //   style: TextTheme.of(
              //     context,
              //   ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 40),
              CustomTextFormField(
                title: 'الاسم الكامل',
                hintText: 'ahmad khaled',
                controller: nameController,
                obscureText: false,
                suffixIcon: Icon(Icons.person),
              ),
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
              SizedBox(height: 20),
              CustomCheckboxListTile(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              MainButton(onPressed: () {}, text: ' إنشاء حساب'),
              SizedBox(height: MediaQuery.of(context).size.height * .26),
              UserQuestionRow(
                onTap: () {
                  Navigator.of(context).pop();
                },
                mainAxisAlignment: MainAxisAlignment.center,
                ask: '  لديك حساب بالفعل ؟ ',
                answer: 'تسجيل الدخول',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
