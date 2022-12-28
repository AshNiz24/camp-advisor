import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addCampSite(
      BuildContext context,
      String name,
      String place,
      String lat,
      String lon,
      String rating,
      String imgPath,
      String desc,
      String cost) async {
    final docRef = firebaseFirestore.collection("posts").add({
      "imgpath": imgPath,
      "latitude": lat,
      "longitude": lon,
      "name": name,
      "place": place,
      "rating": rating,
      "numRating": "1",
      "description": desc,
      "cost": cost
    });
  }
}
