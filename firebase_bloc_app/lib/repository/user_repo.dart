import 'package:firebase_auth/firebase_auth.dart';

class UserRepo {
  FirebaseAuth firebaseAuth;

  UserRepo() {
    this.firebaseAuth = FirebaseAuth.instance;
  }
  Future<FirebaseUser> createUser(String email, String password) async {
    var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }
}
