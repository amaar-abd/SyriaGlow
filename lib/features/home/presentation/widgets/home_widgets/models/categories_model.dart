import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/routes/app_routes.dart';

class Categories {
  final int id;
  final String title;
  final FaIconData icon;

  const Categories({required this.title, required this.icon, required this.id});



  void navigatorToCategory(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.categoryView, arguments: {'id': id, 'title': title});
  }
  
}
