import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/explory_py_catecory_row.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/home_categories_horizontal_list.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/home_list_view_popular_items.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/popular_drstinations_row.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/user_information_column.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(right: 14.w, left: 14.w, top: 12.h),
          sliver: const SliverToBoxAdapter(child: UserInformationColumn()),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            right: 14.w,
            left: 14.w,
            top: 20.h,
            bottom: 12.h,
          ),
          sliver: SliverToBoxAdapter(child: const ExploryPyCatecoryRow()),
        ),
        const SliverToBoxAdapter(child: HomeCategoriesHorizontalList()),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          sliver: const SliverToBoxAdapter(child: PopularDrstinationsRow()),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return SliverFillRemaining(
                  hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryGreen,
                    strokeWidth: 3,
                  ),
                ),
              );
            } else if (state is HomeFailure) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              );
            } else if (state is HomeSuccess) {
              return SliverPadding(
                
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                sliver: HomeListViewPopularItems(landmarks: state.landmarks),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
