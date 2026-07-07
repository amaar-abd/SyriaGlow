import 'package:flutter/material.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/profile/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryGreen),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'المفضلة ',
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:const FavoriteViewBody(),
    );
  }
}
