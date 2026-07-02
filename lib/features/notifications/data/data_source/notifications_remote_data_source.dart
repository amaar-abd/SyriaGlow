import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syria_glow/core/networking/api_constants.dart';

abstract class NotificationsRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotificationsStream();
}

class NotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  NotificationsRemoteDataSourceImpl({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotificationsStream() {
    return firestore
        .collection(ApiConstants.publicNotifications)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
