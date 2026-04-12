import 'package:flutter/material.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.title,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
  });
  final String? title;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: TextTheme.of(
            context,
          ).bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 4)],
          ),
          child: TextFormField(
            obscureText: obscureText ?? true,
            controller: controller,
            style: TextTheme.of(context).bodyMedium,
            validator: (value) =>
                value == null || value.isEmpty ? 'هذا الحقل مطلوب' : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: TextTheme.of(context).bodySmall,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryGreenLight),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
