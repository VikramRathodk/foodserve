// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodserve/firebase_options.dart';
import 'package:foodserve/pages/cart_page.dart';
import 'package:foodserve/pages/navigator.dart';
import 'package:foodserve/pages/landing_page.dart';
import 'package:foodserve/pages/settings.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
   
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavogatorPage();
          } else {
            return LandingPage();
          }
        },
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
    '/cartpage': (context) =>  CartPage(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/s': (context) => const SettingsPage(),
      },
    );
  }
}
