import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/views/widgets/home_categories_horizontal_list.dart';
import 'package:syria_glow/features/home/presentation/views/widgets/user_information_column.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(right: 14.w, left: 14.w, top: 12.h),
          sliver: SliverToBoxAdapter(child: UserInformationColumn()),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            right: 14.w,
            left: 14.w,
            top: 20.h,
            bottom: 12.h,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'اكتشف حسب التصنيف',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'عرض الكل',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.elegantGold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: HomeCategoriesHorizontalList()),
      ],
    );
  }
}
