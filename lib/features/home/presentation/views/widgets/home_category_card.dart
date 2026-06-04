import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            
            children: [
              Material(
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(25.r),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryGreen,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.brandsFontAwesome,
                      color: AppColors.primaryGreen,
                      size: 30.r,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'تراثية',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textDark,
                ),
              ),
            ],
         
          );
      
  }
}