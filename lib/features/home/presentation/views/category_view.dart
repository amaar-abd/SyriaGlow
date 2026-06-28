import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/manager/home_category_cubit/category_cubit.dart';
import 'package:syria_glow/features/home/presentation/widgets/category_widgeets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });
  final int categoryId;
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          categoryTitle,
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            sl.get<CategoryCubit>()..getCategory(id: categoryId),
        child: CategoryViewBody(
          categoryId: categoryId,
          categoryTitle: categoryTitle,
        ),
      ),
    );
  }
}
