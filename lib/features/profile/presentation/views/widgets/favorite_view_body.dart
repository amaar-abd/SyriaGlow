import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:syria_glow/features/profile/presentation/views/widgets/empty_favorites_widget.dart';
import 'package:syria_glow/features/profile/presentation/views/widgets/favorite_landmark_item.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
        buildWhen: (previous, current) => 
          current is GetFavoritesLoading || 
          current is GetFavoritesFailure || 
          current is GetFavoritesSuccess,
      builder: (context, state) {
        if (state is GetFavoritesLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 3,
            ),
          );
        } else if (state is GetFavoritesFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: TextStyle(fontSize: 16.sp, color: Colors.red),
            ),
          );
        } else if (state is GetFavoritesSuccess) {
          final List<Landmark> landmarksFav = state.favorites;
          if (landmarksFav.isEmpty) {
            return const EmptyFavoritesWidget();
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            itemCount: landmarksFav.length,
            itemBuilder: (context, index) {
              return FavoriteLandmarkItem(landmark: landmarksFav[index]);
            },
          );
        }
           return const EmptyFavoritesWidget();
      },
    );
  }
}
