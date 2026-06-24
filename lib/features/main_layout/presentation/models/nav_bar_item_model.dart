import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBarItemModel {
  final String label;
  final FaIconData icon;
  final FaIconData activeIcon;

 const NavBarItemModel({required this.label, required this.icon,required this.activeIcon});
}
