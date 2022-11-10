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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  // ignore: prefer_const_constructors
                  CircularProgressIndicator(
                    color: Colors.blue,
                  );
                  await _auth.signOut();
                  Navigator.of(context).pushReplacementNamed("/login");
                },
                child: Center(child: Text("Logout")))
          ]),
        ),
      ),
    );
  }
}
