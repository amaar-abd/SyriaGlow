import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/popular_item.dart';

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
      // key: ValueKey('popular_${landmark.id}'),
      landmark: landmark,
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.homeDetailsView,
          arguments: landmark,
        );
      },
    );
    // .animate()
    // .fade(
    //   delay: const Duration(milliseconds: 100),
    //   duration: const Duration(milliseconds: 350),
    //   curve: Curves.easeOut,
    // )
    // .slideX(
    //   begin: 0.15,
    //   end: 0.0,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeOutQuad,
    // );
  }
}
