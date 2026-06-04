import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/home/presentation/views/home_view.dart';
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
    const HomeView(),
    const Center(child: Text('شاشة البحث (Search)')),
    const Center(child: Text('شاشة العروض / سيريا غلو')),
    const Center(child: Text('شاشة الحساب (saved)')),
    const Center(child: Text('شاشة الحساب (Profile)')),
  ];
  @override
  Widget build(BuildContext context) {
    final List<NavBarItemModel> navBarItems = [
      NavBarItemModel(
        label: context.l10n.nav_home,
        icon: FontAwesomeIcons.houseChimney,
      ),
      NavBarItemModel(
        label: context.l10n.nav_explore,
        icon: FontAwesomeIcons.solidCompass,
      ),
      NavBarItemModel(
        label: context.l10n.nav_my_trips,
        icon: FontAwesomeIcons.solidMap,
      ),
      NavBarItemModel(
        label: context.l10n.nav_favorites,
        icon: FontAwesomeIcons.solidFloppyDisk,
      ),
      NavBarItemModel(
        label: context.l10n.nav_profile,
        icon: FontAwesomeIcons.solidUser,
      ),
    ];

    final List<PreferredSizeWidget> appBars = [
      AppBar(
        toolbarHeight: 70,
         automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(FontAwesomeIcons.solidUser, color: AppColors.primaryGreen),
            // Image.asset(Assets.assetsImagesMan),
            SizedBox(width: 10.w),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withAlpha(20),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.bell,
                  color: AppColors.primaryGreen,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withAlpha(20),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.list,
                  color: AppColors.primaryGreen,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      AppBar(
        title: Text(context.l10n.nav_explore),
        backgroundColor: Colors.blue,
      ),
      AppBar(title: Text(context.l10n.nav_my_trips)),
      AppBar(title: Text(context.l10n.nav_favorites)),
      AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    ];
    return Scaffold(
      appBar: appBars[currentIndex],
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
