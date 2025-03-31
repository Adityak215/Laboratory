import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudyFire {
  final storageRef = FirebaseStorage.instance.ref();
  final CollectionReference nameref = FirebaseFirestore.instance.collection('name');

  // Create
  Future<void> addName(String name) {
    return nameref.add({
      'name': name,
      'lastchange': Timestamp.now(),
    });
  }

  // Read
  Stream<QuerySnapshot> getNameStream() {
    return nameref.orderBy('lastchange', descending: true).snapshots();
  }

  // Update (Placeholder)
  Future<void> updateName(String docId, String newName) {
    return nameref.doc(docId).update({'name': newName, 'lastchange': Timestamp.now()});
  }

  // Delete (Placeholder)
  Future<void> deleteName(String docId) {
    return nameref.doc(docId).delete();
  }
}
