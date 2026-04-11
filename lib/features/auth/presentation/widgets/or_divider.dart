import 'package:flutter/material.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class Ordivider extends StatelessWidget {
  const Ordivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        const SizedBox(width: 18),
        Text(
          'أو',
          style: TextTheme.of(
            context,
          ).bodyMedium?.copyWith(fontSize: 18, color: AppColors.textDark),
        ),
        const SizedBox(width: 18),
        Expanded(child: Divider()),
      ],
    );
  }
}
