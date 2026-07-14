import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/notifications/presentation/manager/notification_cubit/notifications_cubit.dart';
import 'package:syria_glow/features/notifications/presentation/widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryGreen),
        centerTitle: true,
        elevation: 0,
        title: Text(
         context.l10n.notifications,
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl.get<NotificationsCubit>()..streamNotifications(),
        child:const NotificationsViewBody(),
      ),
    );
  }
}
