import 'package:pafp/login/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  Users _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // sign in with email & password

  // register with email & password
  void registerWithEmailAndPassword(String email, String password) async {
    try {
      FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      // create a new document for the user with the uid
    } catch (error) {
      print(error.toString());
    }
  }

  // sign out
  void signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
