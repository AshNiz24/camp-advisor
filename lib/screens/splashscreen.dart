// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:camp_advisor/screens/landingScreen.dart';
import 'package:camp_advisor/screens/main_navigation_screen.dart';
import 'package:camp_advisor/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? currentUser;
  AuthServices authServices = AuthServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = authServices.firebaseAuth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      duration: 5000,
      splash: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/splash1.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.5),
            ),
          ),
          Center(child: Image.asset("images/logo3.png"))
        ],
      ),
      splashIconSize: 750,
      nextScreen:
          currentUser == null ? LandingScreen() : MainNavigationScreen(),
      backgroundColor: Colors.teal,
    );
  }
}
