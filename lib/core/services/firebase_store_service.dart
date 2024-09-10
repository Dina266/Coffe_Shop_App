import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirebaseStoreService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<void> deleteData({
    required String path,
    required String id,
  }) async {
    await firestore.collection(path).doc(id).delete();
  }
}
