import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:syria_glow/features/home/data/models/landmark_model.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/details_widgets/home_details_view_body.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key, required this.landmark});
  final Landmark landmark;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, 
        statusBarIconBrightness: Brightness.light, 
        statusBarBrightness: Brightness.dark, 
      ),
      child: Scaffold(
     
        backgroundColor: Colors.white,
        body: HomeDetailsViewBody(landmark: landmark),
      ),
    );
  }
}










   // extendBody: true,
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.transparent,
        //   surfaceTintColor: Colors.transparent,
        //   title: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 2.w),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         DetailsAppBarCircleButton(
        //           icon: Icons.arrow_back_ios_new_rounded,
        //           onPressed: () => Navigator.pop(context),
        //         ),
        //         DetailsAppBarCircleButton(
        //           icon: Icons.favorite_border_rounded,
        //           iconColor: AppColors.elegantGold,
        //           onPressed: () {
        //             //favoret logic
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),