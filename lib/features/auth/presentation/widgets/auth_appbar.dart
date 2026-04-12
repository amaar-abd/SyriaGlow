import 'package:flutter/material.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

AppBar authAppBar(
  BuildContext context, {
  String? titlle,
  bool showButton = false,
}) {
  return AppBar(
    backgroundColor: AppColors.backgroundLight,
    centerTitle: true,
    title: Text(titlle ?? '', style: TextTheme.of(context).displayMedium),
    leading: Visibility(
      visible: showButton,
      child: IconButton(
        icon: Icon(Icons.arrow_back_rounded, size: 30),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
