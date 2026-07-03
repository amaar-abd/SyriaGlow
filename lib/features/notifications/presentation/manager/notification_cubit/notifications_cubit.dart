import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/notifications/data/models/notification_model.dart';
import 'package:syria_glow/features/notifications/domain/repos/notifications_repository.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.repository) : super(NotificationsInitial());

  final NotificationsRepository repository;
  StreamSubscription? _notificationsSubscription;

  void streamNotifications() {
    emit(NotificationsLoading());
    _notificationsSubscription?.cancel();

    _notificationsSubscription = repository.streamNotifications().listen(
      (notifications) {
        bool showRedDot = notifications.any(
          (notification) => !notification.isRead,
        );
        emit(
          NotificationsSuccess(
            notifications: notifications,
            unread: showRedDot,
          ),
        );
      },
      onError: (error) {
        emit(NotificationsFailure(message: error.toString()));
      },
    );
  }

  void clearRedDot() async {
    try {
      await repository.markNotificationsAsRead();
    } catch (error) {
      emit(NotificationsFailure(message: error.toString()));
    }
  }

  @override
  Future<void> close() {
    _notificationsSubscription?.cancel();
    return super.close();
  }
}
