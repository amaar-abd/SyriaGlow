import 'package:flutter/material.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/widgets/category_widgeets/all_categories_view_body.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryGreen),
        centerTitle: true,
        elevation: 0,
        title: Text(
          context.l10n.discoverByCategory,
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),body: AllCategoriesViewBody(),);
  }
}
