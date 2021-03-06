import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {


  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, "/walkthrough"));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: basicColor,
      body: Container(
        child: Center(
          child: Image(
            image:  AssetImage("images/logo.png"),
            height: height/4,

          ),
        ),
      ),
    );
  }
}
