import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/features/main_layout/presentation/models/nav_bar_item_model.dart';
import 'package:syria_glow/features/main_layout/presentation/widgets/custom_bottom_nav_bar.dart';

class MainLayoutViewBody extends StatefulWidget {
  const MainLayoutViewBody({super.key});

  @override
  State<MainLayoutViewBody> createState() => _MainLayoutViewBodyState();
}

class _MainLayoutViewBodyState extends State<MainLayoutViewBody> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('شاشة الرئيسية (Home)')),
    const Center(child: Text('شاشة البحث (Search)')),
    const Center(child: Text('شاشة العروض / سيريا غلو')),
    const Center(child: Text('شاشة الحساب (saved)')),
    const Center(child: Text('شاشة الحساب (Profile)')),
  ];
  @override
  Widget build(BuildContext context) {
    final List<NavBarItemModel> navBarItems = [
      NavBarItemModel(label: context.l10n.nav_home, icon: FontAwesomeIcons.houseChimney),
      NavBarItemModel(label: context.l10n.nav_explore, icon: FontAwesomeIcons.compass),
      NavBarItemModel(label: context.l10n.nav_my_trips, icon: FontAwesomeIcons.map),
      NavBarItemModel(label: context.l10n.nav_favorites, icon: FontAwesomeIcons.floppyDisk),
      NavBarItemModel(label: context.l10n.nav_profile, icon: FontAwesomeIcons.user),
    ];
    
    // final List<PreferredSizeWidget> _appBars = []
    return Scaffold(

      bottomNavigationBar: CustomBottomNavBar(
        menuItems: navBarItems,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: currentIndex, children: _screens),
    );
  }
}
