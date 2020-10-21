import 'package:firebase_auth/firebase_auth.dart';

// da controllare

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email & password
  void signInAndSubmit(String _email , String _password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: _email, password: _password);
    }
    catch(e){
      print(e);
    }
  }

  // register with email & password
  void register(String _email , String _password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
    }
    catch(e){
      print(e);
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
