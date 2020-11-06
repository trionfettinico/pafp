import 'package:firebase_auth/firebase_auth.dart';
import 'package:pafp/database/database.dart';

// da controllare

class AuthService {
  DatabaseService _datab;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  Future<String> createUserAllievo(
      String username, String email, String password) async {
    if (await _datab.checkUsernameIfExist(username) == false) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        _datab = DatabaseService('allievo');
        Map<String, dynamic> prova = {"username": username, "email": email};
        _datab.addDocument(prova);
        return "OK";
      } catch (e) {
        if (e.toString().contains("[firebase_auth/email-already-in-use]")) {
          return "email-already-in-use";
        } else if (e.toString().contains("[firebase_auth/weak-password]")) {
          return "weak-password";
        }
      }
    }
    return "username-presente";
  }

  Future<String> createUserAllenatore(
      String username, String email, String password) async {
    if (await _datab.checkUsernameIfExist(username) == false) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        _datab = DatabaseService('allenatore');
        Map<String, dynamic> prova = {"username": username, "email": email};
        _datab.addDocument(prova);
        return "OK";
      } catch (e) {
        if (e.toString().contains("[firebase_auth/email-already-in-use]")) {
          return "email-already-in-use";
        } else if (e.toString().contains("[firebase_auth/weak-password]")) {
          return "weak-password";
        }
      }
    }
    return "username-presente";
  }

  Future<User> currentUser() async {
    User user = _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
