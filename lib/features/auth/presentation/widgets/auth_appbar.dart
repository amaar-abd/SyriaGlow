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
    title: Text(titlle??'', style: TextTheme.of(context).displayMedium),
    actions: [
      Visibility(
        visible: showButton,
        child: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ],
  );
}
