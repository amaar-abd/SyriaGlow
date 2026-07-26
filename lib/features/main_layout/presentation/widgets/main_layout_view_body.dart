import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/features/assistant/presentation/views/assistant_view.dart';
import 'package:syria_glow/features/explore/presentation/views/explore_view.dart';
import 'package:syria_glow/features/home/presentation/views/home_view.dart';
import 'package:syria_glow/features/main_layout/presentation/models/nav_bar_item_model.dart';
import 'package:syria_glow/features/main_layout/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:syria_glow/features/profile/presentation/views/profile_view.dart';

class MainLayoutViewBody extends StatefulWidget {
  const MainLayoutViewBody({super.key});

  @override
  State<MainLayoutViewBody> createState() => _MainLayoutViewBodyState();
}

class _MainLayoutViewBodyState extends State<MainLayoutViewBody> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const ExploreView(),
    const AssistantView()   ,
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    final List<NavBarItemModel> navBarItems = [
      NavBarItemModel(
        label: context.l10n.nav_home,
        icon: FontAwesomeIcons.house,
        activeIcon: FontAwesomeIcons.solidHouse,
      ),
      NavBarItemModel(
        label: context.l10n.nav_explore,
        icon: FontAwesomeIcons.compass,
        activeIcon: FontAwesomeIcons.solidCompass,
      ),
      NavBarItemModel(
        label: context.l10n.nav_services,
        icon: FontAwesomeIcons.rectangleList,
        activeIcon: FontAwesomeIcons.solidRectangleList,
      ),
      NavBarItemModel(
        label: context.l10n.nav_profile,
        icon: FontAwesomeIcons.user,
        activeIcon: FontAwesomeIcons.solidUser,
      ),
    ];
final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      bottomNavigationBar:isLandscape?null: CustomBottomNavBar(
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
