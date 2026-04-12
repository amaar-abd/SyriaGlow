import 'package:flutter/material.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class CustomCheckboxListTile extends StatelessWidget {
  const CustomCheckboxListTile({super.key, this.value, this.onChanged});
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryGreenLight,
        ),
        RichText(
          text: TextSpan(
            style: TextTheme.of(context).bodyMedium,
            children: [
              TextSpan(text: ' أوافق على'),
              TextSpan(
                text: ' شروط الخدمة',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.elegantGold,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: ' و '),
              TextSpan(
                text: 'سياسة الخصوصية',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.elegantGold,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
