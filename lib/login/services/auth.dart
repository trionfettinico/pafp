import 'package:pafp/login/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    FirebaseUser user = await _firebaseAuth.currentUser;
    print("uid ${user.uid}");
    return user;
  }

  Future<String> getEmail() async{
    FirebaseUser user = await _firebaseAuth.currentUser;
    return user.email;
  }
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
