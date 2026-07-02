import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsAppBarCircleButton extends StatelessWidget {
  const DetailsAppBarCircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
      this.iconColor = Colors.white,  this.backgroundColor,
     
  });
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor?? Colors.black.withAlpha(77),
        border: Border.all(color: Colors.white.withAlpha(51)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: 20.sp),
      ),
    );
  }
}
