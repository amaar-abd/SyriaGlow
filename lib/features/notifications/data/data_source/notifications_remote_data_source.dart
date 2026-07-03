import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syria_glow/core/networking/api_constants.dart';

abstract class NotificationsRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotificationsStream();
   Future<void> markPublicNotificationsAsRead();
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
  
  @override
  Future<void> markPublicNotificationsAsRead()async {
    final unreadDocs = await firestore
        .collection(ApiConstants.publicNotifications)
        .where('isRead', isEqualTo: false)
        .get();

    final batch = firestore.batch();
    for (var doc in unreadDocs.docs) {
      batch.update(doc.reference, {'isRead': true});
    }

    await batch.commit();
  }
  }
  

