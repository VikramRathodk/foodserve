// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodserve/models/users.dart';
import 'package:foodserve/Auth/login.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginpage;
  SignUpPage({super.key, required this.showLoginpage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  //sign up to database and go  to Login page
  Future _signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      // Register as new user
      String uid = FirebaseAuth.instance.currentUser!.uid.toString();
      CollectionReference users =
          FirebaseFirestore.instance.collection("users");
      users.add(Users(
              id: uid,
              displayName: _nameController.text,
              email: _emailController.text.trim())
              .toMap()
          );
      //navigating to login screen
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage(
            showRegisterPage: () {},
          );
        },
      ));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 220,
              ),
              Lottie.asset(
                "assets/json/signup.json",
                width: 250,
                height: 180,
                animate: true,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20.0,
              ),
              //name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, -5),
                            blurRadius: 10.0),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(5, 5),
                            blurRadius: 10.0),
                      ]),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Text("Name"),
                      hintText: "Enter your Name here",
                    ),
                  ),
                ),
              ),
              //email
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, -5),
                            blurRadius: 10.0),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(5, 5),
                            blurRadius: 10.0),
                      ]),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Text("Email"),
                      hintText: "Enter your Email here",
                    ),
                  ),
                ),
              ),
              //password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, -5),
                            blurRadius: 10.0),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(5, 5),
                            blurRadius: 10.0),
                      ]),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Text("Password"),
                      hintText: "Enter your password here",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.green.shade400,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(15.0),
                        right: Radius.circular(15.0))),
                child: MaterialButton(
                  onPressed: () {
                    _signup();
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "I am a member !",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginpage,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
