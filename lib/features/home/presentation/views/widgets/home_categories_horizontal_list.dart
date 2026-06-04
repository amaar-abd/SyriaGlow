import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/features/home/presentation/views/widgets/home_category_card.dart';

class HomeCategoriesHorizontalList extends StatelessWidget {
  const HomeCategoriesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 10.w),
            child: HomeCategoryCard(),
          );
        },
      ),
    );
  }
}
