import 'dart:async';

import 'package:firebase_toshal/home.dart';
import 'package:firebase_toshal/login_screen.dart';
import 'package:firebase_toshal/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => splashState();
}

class splashState extends State<splash> {
  // late Animation<double> controller ;
  static String KEYLOGIN = "Login";

  @override
  void initState() {
    whereToGo();
    super.initState();
    // controller = AnimationController(vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Lottie.asset(
            "assets/90751-android-app-background.json",
            fit: BoxFit.cover,
          )),
    );
  }

  void whereToGo() async {
    var sharedpref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedpref.getBool(splashState.KEYLOGIN);

    Timer(Duration(milliseconds: 2000), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }else{
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnboardingScreen()));
        }
      }else{
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OnboardingScreen()));
      }
    });
  }
}
