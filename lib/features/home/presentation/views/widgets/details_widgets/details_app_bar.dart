import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/views/widgets/details_widgets/details_app_bar_circle_button.dart';

class DetailsAppBar extends StatelessWidget  {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailsAppBarCircleButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          DetailsAppBarCircleButton(
            icon: Icons.favorite_border_rounded,
            iconColor: AppColors.elegantGold,
            onPressed: () {
              //favoret logic
            },
          ),
        ],
      ),
    );
  }
}
