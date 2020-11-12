import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference ref;

  DatabaseService();

  Future<String> getTypeAccountEmail(String email) async {
    var data = await _db
        .collection('allenatore')
        .where('email', isEqualTo: email)
        .get();
    if (data.docs.isEmpty) {
      data = await _db
          .collection('allievo')
          .where('email', isEqualTo: email)
          .get();
      if (data.docs.isEmpty) {
        return "email-assente";
      } else {
        return "allievo";
      }
    } else {
      return "allenatore";
    }
  }

  Future<String> getTypeAccountUsername(String username) async {
    var data = await _db
        .collection('allenatore')
        .where('username', isEqualTo: username)
        .get();
    if (data.docs.isEmpty) {
      data = await _db
          .collection('allievo')
          .where('username', isEqualTo: username)
          .get();
      if (data.docs.isEmpty) {
        return "username-assente";
      } else {
        return "allievo";
      }
    } else {
      return "allenatore";
    }
  }

  Future<bool> checkUsernameIfExist(String username) async {
    var data = await _db
        .collection('allenatore')
        .where('username', isEqualTo: username)
        .get();
    if (data.docs.isEmpty) {
      data = await _db
          .collection('allievo')
          .where('username', isEqualTo: username)
          .get();
      if (data.docs.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  Future<String> getEmailFromUsername(String username) async {
    var data = await _db
        .collection('allenatore')
        .where('username', isEqualTo: username)
        .get();
    if (data.docs.isEmpty) {
      data = await _db
          .collection('allievo')
          .where('username', isEqualTo: username)
          .get();
      if (data.docs.isEmpty) {
        return "username-assente";
      } else {
        return (data.docs[0]
            .data()
            .toString()
            .split(",")[0]
            .split(":")[1]
            .trim());
      }
    } else {
      return (data.docs[0]
          .data()
          .toString()
          .split(",")[0]
          .split(":")[1]
          .trim());
    }
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addAllievo(Map data) {
    ref = _db.collection('allievo');
    return ref.add(data);
  }

  Future<DocumentReference> addAllenatore(Map data) {
    ref = _db.collection('allenatore');
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.doc(id).update(data);
  }
}
