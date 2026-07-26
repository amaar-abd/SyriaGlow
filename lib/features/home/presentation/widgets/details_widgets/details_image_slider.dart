import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/widgets/details_widgets/details_app_bar.dart';

class DetailsImageSlider extends StatefulWidget   {
  const DetailsImageSlider({super.key, required this.landmark});
  final Landmark landmark;

  @override
  State<DetailsImageSlider> createState() => _DetailsImageSliderState();
}

class _DetailsImageSliderState extends State<DetailsImageSlider> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.landmark.images;
    final double sliderHeight = MediaQuery.of(context).size.height * 0.50;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
      child: Container(
        height: sliderHeight,
        width: double.infinity,
        color: AppColors.primaryGreen, 
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (images.isNotEmpty)
              PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Hero(
                    tag:widget.landmark.id ,
                     createRectTween: (begin, end) {
                    return MaterialRectArcTween(begin: begin, end: end);
                  },
                    child: CachedNetworkImage(
                      imageUrl: images[index].image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color:  Color(0xFFD4AF37),strokeWidth: 3, 
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image, size: 50),
                    ),
                  );
                },
              )
            else
              Container(color: AppColors.primaryGreen.withAlpha(51)),
            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withAlpha(115),
                      Colors.transparent,
                      Colors.black.withAlpha(166),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
      top: MediaQuery.of(context).padding.top + 8.h, 
      left: 8.w,
      right: 8.w,
      child:  DetailsAppBar(landmarkId: widget.landmark.id.toString(),), 
    ),
            if (images.length > 1)
              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 7.h,
                        width: _currentPage == index ? 22.w : 7.w,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.elegantGold
                              : Colors.white.withAlpha(153),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
} 