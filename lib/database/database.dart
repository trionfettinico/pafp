import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  CollectionReference ref;

  DatabaseService(this.path) {
    ref = _db.collection(path);
  }

  Future<String> getTypeAccount(String email) async {
    QuerySnapshot snap = await _db.collection("allenatore").get();
    String app;
    snap.docs.forEach((element) {
      app = element.data().toString().split("email:")[1];
      app = app.split(",")[0].trim();
      if (app == email) {
        return "allenatore";
      }
    });
    snap = await _db.collection("allievo").get();
    snap.docs.forEach((element) {
      app = element.data().toString().split("email:")[1];
      app = app.split(",")[0].trim();
      if (app == email) {
        return "allievo";
      }
    });
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

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.doc(id).update(data);
  }
}
