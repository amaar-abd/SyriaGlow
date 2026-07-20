import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/utils/app_images.dart';

class SyriaFlagWidget extends StatelessWidget {
  const SyriaFlagWidget({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2.r),
      child: Image.asset(
        Assets.assetsImagesSyriaflagg,
        width: width.w,
        height: height.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
