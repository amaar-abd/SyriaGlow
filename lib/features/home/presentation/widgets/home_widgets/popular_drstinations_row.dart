import 'package:flutter/material.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class PopularDrstinationsRow extends StatelessWidget {
  const PopularDrstinationsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.l10n.mostVisitedPlaces,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),

        // GestureDetector(
        //   onTap: () {},
        //   child: Text(
        //     'عرض الكل',
        //     style: context.textTheme.bodySmall?.copyWith(
        //       color: AppColors.elegantGold,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
