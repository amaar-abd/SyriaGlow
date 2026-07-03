import 'package:syria_glow/features/notifications/data/models/notification_model.dart';

abstract class NotificationsRepository {
  Stream<List<NotificationModel>> streamNotifications();
Future<void> markNotificationsAsRead();
 }
