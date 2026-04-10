import 'package:flutter/material.dart';
import 'package:syria_glow/features/onboarding/presentation/widgets/first_page_view.dart';
import 'package:syria_glow/features/onboarding/presentation/widgets/second_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int pageIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [FirstPageView(pageController: pageController,pageIndex: pageIndex,), SecondPageView(pageIndex: pageIndex,)]);
  }
}
