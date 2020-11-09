import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference ref;

  DatabaseService();

  Future<String> getTypeAccount(String email) async {
    QuerySnapshot snap = await _db.collection("allenatore").get();
    String app;
    try {
      snap.docs.forEach((element) {
        app = element.data().toString().split("username:")[1];
        app = app.split("}")[0].trim();
        app = element.data().toString().split("email:")[1];
        app = app.split(",")[0].trim();
        if (app == email) {
          throw "allenatore";
        }
      });
    } catch (e) {
      return e.toString();
    }
    try {
      snap = await _db.collection("allievo").get();
      snap.docs.forEach((element) {
        app = element.data().toString().split("username:")[1];
        app = app.split("}")[0].trim();
        app = element.data().toString().split("email:")[1];
        app = app.split(",")[0].trim();
        if (app == email) {
          throw "allievo";
        }
      });
    } catch (e) {
      return e.toString();
    }
    return "assente";
  }

  Future<bool> checkUsernameIfExist(String username) async {
    QuerySnapshot snap = await _db.collection("allenatore").get();
    String app;
    try {
      snap.docs.forEach((element) {
        app = element.data().toString().split("username:")[1];
        app = app.split("}")[0].trim();
        if (app.trim().toLowerCase() == username.trim().toLowerCase()) {
          throw ("find");
        }
      });
    } catch (e) {
      return true;
    }
    try {
      snap = await _db.collection("allievo").get();
      snap.docs.forEach((element) {
        app = element.data().toString().split("username:")[1];
        app = app.split("}")[0].trim();
        if (app.trim().toLowerCase() == username.trim().toLowerCase()) {
          throw ("find");
        }
      });
    } catch (e) {
      return true;
    }
    return false;
  }

  Future<String> getEmailFromUsername(String username) async {
    QuerySnapshot snap = await _db.collection("allenatore").get();
    String app;
    try {
      snap.docs.forEach((element) {
        app = element.data().toString().split("username:")[1];
        app = app.split("}")[0].trim();
        if (app.trim().toLowerCase() == username.trim().toLowerCase()) {
          app = element.data().toString().split("email:")[1];
          app = app.split(",")[0].trim();
          throw (app);
        }
      });
    } catch (e) {
      return e.toString();
    }
    try {
      snap = await _db.collection("allievo").get();
      snap.docs.forEach((element) {
        app = element.data().toString().split("username:")[1];
        app = app.split("}")[0].trim();
        if (app.trim().toLowerCase() == username.trim().toLowerCase()) {
          app = element.data().toString().split("email:")[1];
          app = app.split(",")[0].trim();
          throw (app);
        }
      });
    } catch (e) {
      return e.toString();
    }
    return "username-assente";
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
