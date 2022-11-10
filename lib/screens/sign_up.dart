// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:playground/screens/sign_in.dart';
import 'package:playground/constants/text_constants.dart';
import 'package:playground/services/auth_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final AuthService _auth = AuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    " Sign up to get started!",
                    style: authcolor.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: nameController,
                    decoration: constdeco.copyWith(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Name",
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: constdeco.copyWith(
                        hintText: "Email Address",
                        prefixIcon: Icon(Icons.mail)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: passwordController,
                    decoration: constdeco.copyWith(
                        hintText: "Password", prefixIcon: Icon(Icons.lock)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      //register with email and password
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          emailController.text, passwordController.text);
                      if (result == null) {
                        print("error signing in");
                      } else {
                        print(result.uid);
                      }
                    },
                    child: Center(child: Text("Create Account")),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                          height: 36,
                        ),
                      ),
                    ),
                    Text(
                      "Continue with",
                      style: authcolor.copyWith(fontSize: 15),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                          height: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.gamepad,
                          size: 40,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook,
                          size: 40,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.apple,
                          size: 40,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignInPage()));
                    },
                    child: Text(
                      "I have an Account",
                      style: authcolor.copyWith(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}