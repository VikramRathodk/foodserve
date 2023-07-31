// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LandingPageCard extends StatelessWidget {
  dynamic child, text1, subtext;
  LandingPageCard(
      {super.key,
      required this.child,
      required this.text1,
      required this.subtext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image(
                  fit: BoxFit.cover,
                  
                  image: child,
                )),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(child: text1),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(child: subtext),
        ],
      ),
    );
  }
}
