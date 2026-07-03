import 'package:syria_glow/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:syria_glow/features/notifications/data/models/notification_model.dart';
import 'package:syria_glow/features/notifications/domain/repos/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl({required this.remoteDataSource});
  final NotificationsRemoteDataSource remoteDataSource;

  @override
  Stream<List<NotificationModel>> streamNotifications() {
    return remoteDataSource.getNotificationsStream().map((snapshot) {
      return snapshot.docs.map((doc) => NotificationModel.fromFirestore(doc)).toList();
    });
  }
  
  @override
  Future<void> markNotificationsAsRead() async{
   await remoteDataSource.markPublicNotificationsAsRead();
  }
 

  }

