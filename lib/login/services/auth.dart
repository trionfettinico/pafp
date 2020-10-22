import 'package:firebase_auth/firebase_auth.dart';

// da controllare

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)) as FirebaseUser;
    return user.uid;
  }

  Future<String> createUser(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)) as FirebaseUser;
    return user.uid;
  }

  Future<FirebaseUser> currentUser() async {
    FirebaseUser user = _firebaseAuth.currentUser as FirebaseUser;
    print("uid ${user.uid}");
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

}
