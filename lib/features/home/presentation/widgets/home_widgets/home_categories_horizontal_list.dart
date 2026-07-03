import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/models/categories_data.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/home_category_card.dart';

class HomeCategoriesHorizontalList extends StatelessWidget {
  const HomeCategoriesHorizontalList({super.key});
  @override
  Widget build(BuildContext context) {
    final categories = CategoriesData.getStaticCategories(context);

    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 24.w),
            child: HomeCategoryItem(
              onTap: () => category.navigatorToCategory(context),
              title: categories[index].title,
              icon: categories[index].icon,
            ),
          );
        },
      ),
    );
  }
}
