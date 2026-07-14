import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:syria_glow/features/home/presentation/manager/user_location_cubit/user_location_cubit.dart';
import 'package:syria_glow/features/main_layout/presentation/widgets/main_layout_view_body.dart';
import 'package:syria_glow/features/notifications/presentation/manager/notification_cubit/notifications_cubit.dart';
import 'package:syria_glow/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLanguage = Localizations.localeOf(context).languageCode;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<UserLocationCubit>()
                ..fetchLocation(languageCode: currentLanguage),
        ),
        BlocProvider(
          create: (context) => sl<NotificationsCubit>()..streamNotifications(),
        ),
        BlocProvider.value(
          value: sl<FavoriteCubit>()..fetchFavorites(),
        ),
        BlocProvider.value(value:   sl<ProfileCubit>()),
      ],
      child: const MainLayoutViewBody(),
    );
  }
}
