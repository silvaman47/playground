// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:playground/services/auth_services.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  AuthService _auth = AuthService();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            !isloading ?ElevatedButton(
                onPressed: () async {
                  // ignore: prefer_const_constructors

                  setState(() {
                    isloading = false;
                    isloading =!isloading;
                  });
                  
                  await _auth.signOut();
                  Navigator.of(context).pushReplacementNamed("/login");
                },
                child: Center(child: Text("Logout"),
                ),
                ):Center(
                  child: CircularProgressIndicator(),
                )
          ]),
        ),
      ),
    );
  }
}
