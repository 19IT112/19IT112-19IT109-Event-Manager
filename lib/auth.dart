import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth;
  Auth(this.auth);

  Stream<User?> get authstateChanges => auth.idTokenChanges();

  // sign Up
  Future signUp(String? email, String? password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e;
    }
  }

  //Login
  Future login(String? email, String? password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //sign out
  Future signOut() async {
    await auth.signOut();
    print("hello");
  }
}
