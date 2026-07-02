import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/notifications/presentation/manager/notification_cubit/notifications_cubit.dart';
import 'package:syria_glow/features/notifications/presentation/widgets/empty_notifications_view.dart';
import 'package:syria_glow/features/notifications/presentation/widgets/notifications_list_view.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsLoading) {
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 3,
            ),
          );
        } else if (state is NotificationsSuccess) {
          final notificationsList = state.notifications;

          if (notificationsList.isEmpty) {
            return const EmptyNotificationsView();
          }
          return NotificationsListView(notifications: notificationsList);
        } else if (state is NotificationsFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }
        return const EmptyNotificationsView();
      },
    );
  }
}
