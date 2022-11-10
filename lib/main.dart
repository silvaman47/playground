// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:playground/screens/appmainpage.dart';
import 'package:playground/screens/sign_up.dart';
import 'package:playground/screens/sign_in.dart';
import 'package:playground/services/auth_services.dart';

AuthService _authService = AuthService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Widget _defaultHome = SignInPage();

  //checking if user is logged in
  // bool _result = await _authService.login();
  // if (_result) {
  //   _defaultHome = Homepage();
  // }

  if (FirebaseAuth.instance.currentUser?.uid == null) {
// not logged
    _defaultHome = SignInPage();
  } else {
// logged
    _defaultHome = Homepage();
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => Homepage(),
      '/login': (BuildContext context) => SignInPage(),
      '/appmain':(BuildContext context) => AppMain()
    },
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Homepage(),
//     );
//   }
// }
