import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/main_layout/presentation/models/nav_bar_item_model.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
    this.onTap,
    required this.currentIndex,
    required this.menuItems,
  });
  final void Function(int)? onTap;
  final int currentIndex;
  final List<NavBarItemModel> menuItems;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;
        return Container(
          height: isLandscape ? 70.h : 68.h,
          margin: EdgeInsets.symmetric(
            vertical: isLandscape ? 0 : 5.h,
            horizontal: isLandscape ? 0 : 12.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: isLandscape ? 4.h : 0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9FB),
            borderRadius: isLandscape ? null : BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(80),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(widget.menuItems.length, (index) {
              final isSelected = widget.currentIndex == index;
              return Expanded(
                child: InkWell(
                  onTap: () {
                    widget.onTap!(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 2.w,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryGreen.withAlpha(30)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          isSelected
                              ? widget.menuItems[index].activeIcon
                              : widget.menuItems[index].icon,
                          color: isSelected
                              ? AppColors.primaryGreen
                              : const Color(0xff8A8A8E),
                          size: isLandscape ? 8.sp : 22.sp,
                        ),
                        SizedBox(height: 6.h),
                        Flexible(
                          child: Text(
                            widget.menuItems[index].label,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.primaryGreen
                                  : const Color(0xff8A8A8E),
                              fontWeight: FontWeight.bold,
                              fontSize: isLandscape ? 11 : 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
