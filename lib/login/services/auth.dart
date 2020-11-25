import 'package:firebase_auth/firebase_auth.dart';
import 'package:pafp/database/database.dart';

// da controllare

class AuthService {
  DatabaseService _datab;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "ok";
    } catch (e) {
      return "email o password errata";
    }
  }

  Future<String> createUserAllievo(
      String username, String email, String password) async {
    _datab = DatabaseService();
    var app = await _datab.checkUsernameIfExist(username);
    if (app == false) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        Map<String, dynamic> prova = {"username": username, "email": email};
        _datab.addAllievo(prova);
        _datab.getEmailFromUsername(username);
        return "OK";
      } catch (e) {
        if (e.toString().contains("[firebase_auth/email-already-in-use]")) {
          return "email-already-in-use";
        } else if (e.toString().contains("[firebase_auth/weak-password]")) {
          return "weak-password";
        }
      }
    } else {
      return "username-presente";
    }
  }

  Future<String> createUserAllenatore(
      String username, String email, String password) async {
    _datab = DatabaseService();
    var app = await _datab.checkUsernameIfExist(username);
    if (app == false) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        Map<String, dynamic> prova = {"username": username, "email": email};
        _datab.addAllenatore(prova);
        return "ok";
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
