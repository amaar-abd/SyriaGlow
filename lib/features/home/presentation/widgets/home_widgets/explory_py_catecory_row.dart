import 'package:flutter/material.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class ExploryPyCatecoryRow extends StatelessWidget {
  const ExploryPyCatecoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.l10n.discoverByCategory,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),

        TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
              AppColors.primaryGreen.withAlpha(50),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.allCategoriesView);
          },
          child: Text(
            context.l10n.viewAll,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.elegantGold,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
