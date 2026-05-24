import 'package:flutter/material.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              SizedBox(height: 40),
              CustomTextFormField(
                title: context.l10n.fullNameTitle,
                hintText: context.l10n.fullNameHint,
                controller: nameController,
                obscureText: false,
                suffixIcon: Icon(Icons.person, color: AppColors.primaryGreen),
              ),
              CustomTextFormField(
                title: context.l10n.emailTitle,
                hintText: context.l10n.emailHint,
                controller: emailController,
                obscureText: false,
                suffixIcon: Icon(Icons.email, color: AppColors.primaryGreen),
              ),
              CustomTextFormField(
                title: context.l10n.passwordTitle,
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
                    color: AppColors.primaryGreen,
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
              MainButton(onPressed: () {}, text: context.l10n.signUpButton),
              SizedBox(height: MediaQuery.of(context).size.height * .26),
              UserQuestionRow(
                onTap: () {
                  Navigator.of(context).pop();
                },
                mainAxisAlignment: MainAxisAlignment.center,
                ask: context.l10n.alreadyHaveAccount,
                answer: context.l10n.loginText,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
