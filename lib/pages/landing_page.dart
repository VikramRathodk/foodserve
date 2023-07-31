// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:foodserve/Auth/auth_page.dart';
import 'package:foodserve/Auth/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Reuseable/landingPageCard.dart';
import 'navigator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 600,
              child: PageView(
                controller: _pageController,
                children: [
                  LandingPageCard(
                    child: AssetImage("assets/images/maggi.jpeg"),
                    text1: Text(
                      "The Fastest In Delivery Food",
                      style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    subtext: Text(
                      "Our job is to filling your tummy with \ndelicious food and fast delivery.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.arapey(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  LandingPageCard(
                    child: AssetImage("assets/images/page2image.jpeg"),
                    text1: Text(
                      "Easy To order",
                      style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    subtext: Text(
                      "you only need a few steps\n in ordering food.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.arapey(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  LandingPageCard(
                    child: AssetImage(
                      "assets/images/pizzapic.jpeg",
                    ),
                    text1: Text(
                      "Best Quality",
                      style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    subtext: Text(
                      "Not only fast for us\n quality is also number one.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.arapey(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                activeDotColor: Colors.yellow,
                dotColor: Colors.black,
                spacing: 5.0,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25.0),
                      right: Radius.circular(25.0))),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AuthPage();
                    },
                  ));
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
