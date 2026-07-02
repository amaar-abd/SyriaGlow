part of 'notifications_cubit.dart';

sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsSuccess extends NotificationsState {
  final List<NotificationModel> notifications;
  final bool unread;

  NotificationsSuccess({required this.notifications,required this.unread});
}

final class NotificationsFailure extends NotificationsState {
  final String message;

  NotificationsFailure({required this.message});
}
