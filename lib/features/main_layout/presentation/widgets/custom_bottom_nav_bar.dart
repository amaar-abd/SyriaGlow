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
    return Container(
      height: 68.h,
      margin: EdgeInsets.only(bottom: 10.h, left: 15.w, right: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.menuItems.length, (index) {
          final isSelected = widget.currentIndex == index;

          return GestureDetector(
            onTap: () {
              widget.onTap!(index);
            },
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linearToEaseOut,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryGreen.withAlpha(20)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  FaIcon(
                    widget.menuItems[index].icon,
                    color: isSelected
                        ? AppColors.primaryGreen
                        : const Color(0xff8A8A8E),
                    size: 24.sp,
                  ),
                  AnimatedCrossFade(
                    firstChild: Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: Text(
                        widget.menuItems[index].label,
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                    crossFadeState: isSelected
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 250),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
