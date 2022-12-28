// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 73,
          backgroundColor: Colors.teal.shade900,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                "${authServices.firebaseAuth.currentUser!.photoURL}"),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "@${authServices.firebaseAuth.currentUser!.displayName!.replaceAll(" ", "").toLowerCase()}",
          style: TextStyle(
            color: Colors.lightGreenAccent,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${authServices.firebaseAuth.currentUser!.displayName}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${authServices.firebaseAuth.currentUser!.email}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Rating: ${Random().nextInt(4) + 1}/5",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Text(
              "Share",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: Text(
              "Help",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: EdgeInsets.zero,
            ),
            onPressed: () async {
              await AuthServices().signOutOfGoogle(context);
            },
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        (authServices.firebaseAuth.currentUser!.email ==
                "sarveshproj21@gmail.com")
            ? Text(
                "(Admin)",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            : Text(
                "(User)",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
        SizedBox(
          height: 4,
        ),
      ],
    ));
  }
}
