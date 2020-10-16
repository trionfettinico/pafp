import 'package:firebase_auth/firebase_auth.dart';

// da controllare

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser

  // sign in with email & password

  // register with email & password

  // sign out
  void signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
