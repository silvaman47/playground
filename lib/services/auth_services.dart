// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:playground/models/uidmodel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UidModel? _userFromFirebaseUser(User user) {
    return user != null ? UidModel(
      uid: user.uid, email: user.email.toString()):null;
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(
      String emailController, String passwordController) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: emailController.toString().trim(),
          password: passwordController.toString().trim());
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String emailController, String passwordController) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: emailController.toString().trim(),
          password: passwordController.toString().trim());
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
