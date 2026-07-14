
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class InitialUserIcon extends StatelessWidget {
  const InitialUserIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
    color: AppColors.primaryGreen.withAlpha(20),
    borderRadius: BorderRadius.circular(30.r),
                  ),
      child: IconButton(
        onPressed: null,
        icon: FaIcon(
          FontAwesomeIcons.solidUser,
          size: 22.r,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }
}
