// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodserve/Widgets.dart/bottom_nav.dart';
import 'package:foodserve/pages/Search_page.dart';
import 'package:foodserve/pages/cart_page.dart';
import 'package:foodserve/pages/home_page.dart';
import 'package:foodserve/pages/my_orders.dart';
import 'package:foodserve/pages/settings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavogatorPage extends StatefulWidget {
  const NavogatorPage({super.key});

  @override
  State<NavogatorPage> createState() => _NavogatorPage();
}

class _NavogatorPage extends State<NavogatorPage> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

  var selectedIndex = 0;
  var displayName = FirebaseAuth.instance.currentUser!.displayName.toString();

  logout() {
    FirebaseAuth.instance.signOut();
    FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
  }

  List<Widget> _pages = [HomePage(), SearchPage(), CartPage(), SettingsPage()];
  tabChanges(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafoldKey,
        backgroundColor: Colors.white,
        //drawer
        drawer: Drawer(
          backgroundColor: Colors.grey.shade100,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.green,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                    title: Text(
                      displayName,
                      style: GoogleFonts.breeSerif(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      style: GoogleFonts.arefRuqaa(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              //log out
              ListTile(
                onTap: (){},
                trailing: Icon(Icons.person_add,color: Colors.blue,),
                title: Text(
                  "Personal Details",
                  style: GoogleFonts.arapey(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              
              //My Orders List
              ListTile(
                onTap: (){
                  Get.to(()=>MyOrders());
                },
                trailing: Icon(Icons.shopping_bag,color: Colors.green,),
                title: Text(
                  "My Orders",
                  style: GoogleFonts.arapey(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),//log out
              ListTile(
                onTap: FirebaseAuth.instance.signOut,
                trailing: Icon(Icons.logout,color: Colors.red,),
                title: Text(
                  "Logout",
                  style: GoogleFonts.arapey(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: _pages[selectedIndex],
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: BottomNav(tabChanges: tabChanges,));
  }
}
