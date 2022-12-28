// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print

import 'package:camp_advisor/screens/details_screen.dart';
import 'package:camp_advisor/services/auth_service.dart';
import 'package:camp_advisor/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

AuthServices authServices = AuthServices();
List<String> campsites = [
  "https://images.unsplash.com/photo-1532339142463-fd0a8979791a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2FtcGluZ3xlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1487730116645-74489c95b41b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2FtcGluZ3xlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1510312305653-8ed496efae75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNhbXBpbmd8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1578645510447-e20b4311e3ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGNhbXBpbmd8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1573108036319-ec6b160d842c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fGNhbXBpbmd8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DocumentSnapshot>? camps;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  DatabaseServices databaseServices = DatabaseServices();
  int page = 0;
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 28,
            ),
            Text(
              "Suggested for you",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              //color: Colors.pink,
              child: StreamBuilder<QuerySnapshot>(
                  stream: firebaseFirestore.collection("posts").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child:
                            Text("An error occurred please try after sometime"),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isNotEmpty) {
                      camps = snapshot.data!.docs;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: camps!.length,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 15,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print("image path:${camps?[index]['imgpath']}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  name: camps![index]["name"],
                                  place: camps![index]["place"],
                                  rating: camps![index]["rating"],
                                  numRating: camps![index]["numRating"],
                                  imgPath: camps![index]['imgpath'],
                                  lat: camps![index]["latitude"],
                                  lon: camps![index]["longitude"],
                                  cost: camps![index]["cost"],
                                  desc: camps![index]["description"],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(
                              bottom: 5,
                            ),
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(
                                    5,
                                    3,
                                  ),
                                  blurRadius: 5,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // width: 180,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          10,
                                        ),
                                      ),
                                      //color: Colors.pink,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            camps![index]["imgpath"]),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          child: Text(
                                            "${camps![index]["name"]}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.location_solid,
                                        color: Colors.red,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      Flexible(
                                        child: Container(
                                          child: Text(
                                            "${camps![index]["place"]}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rate,
                                        size: 18,
                                        color: Colors.amberAccent,
                                      ),
                                      Text(
                                        " ${camps![index]["rating"]}/5",
                                        style: TextStyle(
                                          color: Colors.blueGrey.shade900,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        " (${camps![index]["numRating"]})",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Chip(
                                      label:
                                          Text("Rs ${camps![index]["cost"]}"),
                                      backgroundColor: Colors.teal,
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      labelPadding: EdgeInsets.zero,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Text("No campsites found add a campsite"));
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Top Camp Sites",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider(
                items: campsites
                    .map((items) => Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          // width: MediaQuery.of(context).size.width * 0.1,
                          //  height: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(1, 3),
                                blurRadius: 10,
                              )
                            ],
                            image: DecorationImage(
                              image: NetworkImage(items),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlayCurve: Curves.easeIn,
                  aspectRatio: 16 / 9,
                  // height: MediaQuery.of(context).size.width * 0.3,
                  autoPlayInterval: Duration(
                    seconds: 4,
                  ),
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
