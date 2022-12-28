// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously

import 'package:camp_advisor/screens/landingScreen.dart';
import 'package:camp_advisor/screens/main_navigation_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogele(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try {
          UserCredential userCredential =
              await firebaseAuth.signInWithCredential(credential);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainNavigationScreen()),
              (route) => false);
        } catch (e) {
          final snackBar = SnackBar(
            content: Text(
              'Could not sign In due to error($e)',
              style: TextStyle(
                color: Color(0xffFFF3B0),
                backgroundColor: Color(0xff37007C),
              ),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        final snackBar = SnackBar(
          content: Text(
            'Could not sign In',
            style: TextStyle(
              color: Color(0xffFFF3B0),
              backgroundColor: Color(0xff37007C),
            ),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(
          'Could not sign In due to error($e)',
          style: TextStyle(
            color: Color(0xffFFF3B0),
            backgroundColor: Color(0xff37007C),
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> signOutOfGoogle(BuildContext context) async {
    try {
      googleSignIn.signOut();
      firebaseAuth.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LandingScreen()),
          (route) => false);
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(
          'An error occurred due to error($e)',
          style: TextStyle(
            color: Color(0xffFFF3B0),
            backgroundColor: Color(0xff37007C),
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
