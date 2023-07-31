import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  final  tabChanges;
   BottomNav({super.key, this.tabChanges});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: GNav(
          onTabChange: tabChanges,
          gap: 8,
          tabBackgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          tabBorderRadius: 15.0,
          activeColor: Colors.green,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "cart",
            ),
            GButton(
              icon: Icons.settings,
              text: "Setting",
            ),
          ],
        ));
  }
}
