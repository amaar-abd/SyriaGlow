import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class SwapCurrencyButton extends StatelessWidget {
  const SwapCurrencyButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primaryGreen.withAlpha(30),
        padding: EdgeInsets.all(12.r),
      ),
      icon: Icon(Icons.swap_vert, size: 40.r, color: AppColors.primaryGreen),
    );
  }
}
