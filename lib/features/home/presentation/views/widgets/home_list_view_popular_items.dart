import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/views/widgets/popular_item.dart';

class HomeListViewPopularItems extends StatelessWidget {
  const HomeListViewPopularItems({super.key, required this.landmarks});
  final List<Landmark> landmarks;
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, orientation) {
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;

        if (isLandscape) {
          return SliverGrid.builder(
            itemCount: landmarks.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 15.w,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return _buildAnimatedPopularItem(
                context,
                landmark: landmarks[index],
              );
            },
          );
        }

        return SliverList.builder(
          itemCount: landmarks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: _buildAnimatedPopularItem(
                context,
                landmark: landmarks[index],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAnimatedPopularItem(
    BuildContext context, {
    required Landmark landmark,
  }) {
    return PopularItem(
          landmark: landmark,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.homeDetailsView,arguments: landmark);
          },
        )
        .animate(target: 1)
        .fade(
          delay: const Duration(milliseconds: 120),
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeOut,
        )
        .slideX(
          begin: 0.25,
          end: 0.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuad,
        );
  }
}
