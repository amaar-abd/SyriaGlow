import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/core/utils/app_images.dart';
import 'package:syria_glow/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:syria_glow/features/home/presentation/widgets/home_widgets/home_view_body.dart';
import 'package:syria_glow/features/main_layout/presentation/widgets/location_info_widget.dart';
import 'package:syria_glow/features/notifications/presentation/manager/notification_cubit/notifications_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(Assets.assetsImagesMan, width: 40.r),
            SizedBox(width: 10.w),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withAlpha(20),
                borderRadius: BorderRadius.circular(30),
              ),
              child: BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  bool hasUnread = false;
                  if (state is NotificationsSuccess) {
                    hasUnread = state.unread;
                  }
                  return Stack(
                    children: [
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.bell,
                          color: AppColors.primaryGreen,
                          size: 22.r,
                        ),
                        onPressed: () {
                          context.read<NotificationsCubit>().clearRedDot();
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.notificationsView);
                        },
                      ),
                      if (hasUnread)
                        Positioned(
                          left: 12,
                          top: 8,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.r),
            child: Center(child: LocationInfoWidget()),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => sl.get<HomeCubit>()..mostVisitedPlaces(),
        child:const HomeViewBody(),
      ),
    );
  }
}
