// ignore_for_file: use_build_context_synchronously


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodserve/pages/navigator.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
   const LoginPage({super.key,required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future _login() async {
    //authentication
    try {
      showDialog(
        context: context,
        builder: (context) {
          // ignore: prefer_const_constructors
          return Center(child: CircularProgressIndicator());
        },
      );
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      print(_emailController);
      Navigator.push(context, MaterialPageRoute(
        builder: ((context) {
          return const NavogatorPage();
        }),
      ));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
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
                    _login();
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Not a member ? ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
