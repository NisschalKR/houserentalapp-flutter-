import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProperties() {
    return _firestore.collection('properties').snapshots();
  }

  Future<DocumentSnapshot> getPropertyDetail(String id) async {
    return await _firestore.collection('properties').doc(id).get();
  }
}
