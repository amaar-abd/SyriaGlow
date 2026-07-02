import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/features/notifications/data/models/notification_model.dart';
import 'notification_item.dart'; // تأكد من استيراد كارد الإشعار تبعنا هنا

class NotificationsListView extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotificationsListView({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      padding: EdgeInsets.symmetric(vertical: 6.h), 
      physics: const BouncingScrollPhysics(), 
      itemBuilder: (context, index) {
        return NotificationItem(
          notification: notifications[index],
        );
      },
    );
  }
}