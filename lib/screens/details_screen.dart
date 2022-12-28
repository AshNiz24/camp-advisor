// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.name,
    required this.place,
    required this.rating,
    required this.numRating,
    required this.imgPath,
    required this.lat,
    required this.lon,
    required this.cost,
    required this.desc,
  }) : super(key: key);
  final String name;
  final String place;
  final String rating;
  final String numRating;
  final String imgPath;
  final String lat;
  final String lon;
  final String cost;
  final String desc;
  @override
  Widget build(BuildContext context) {
    double rat = double.parse(rating);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF8F0E3),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Campsite details"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 2,
                ),
              )),
              height: MediaQuery.of(context).size.height * 0.55,
              child: Image.asset(
                'images/gmap.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.33,
              padding: EdgeInsets.only(
                top: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    //color: Colors.pink,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            // left: 8,
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                15,
                              ),
                            ),
                            border: Border.all(
                              color: Colors.teal,
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(imgPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        StarRates(
                          rate: rat,
                        ),
                        Text(
                          '$rating/5',
                          style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "($numRating)",
                          style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.only(
                      top: 12,
                      left: 12,
                    ),
                    //color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location_solid,
                              color: Colors.red,
                              size: 16,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  place,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Latitude: ${double.parse(lat).toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Longitude: ${double.parse(lon).toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Chip(
                              label: Text("Rs ${cost}"),
                              backgroundColor: Colors.teal,
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              labelPadding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StarRates extends StatelessWidget {
  const StarRates({
    Key? key,
    required this.rate,
  }) : super(key: key);
  final double rate;
  @override
  Widget build(BuildContext context) {
    List<Icon> stars = [];
    List<Icon> oneStar = [
      Icon(
        Icons.star_rate,
        color: Colors.yellow,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
    ];
    List<Icon> onePointFiveStar = [
      Icon(
        Icons.star_rate,
        color: Colors.yellow,
        size: 18,
      ),
      Icon(
        Icons.star_half,
        color: Colors.yellow,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
    ];

    List<Icon> twoStar = [
      Icon(
        Icons.star_rate,
        color: Colors.yellow,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.yellow,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
    ];

    List<Icon> twoPointFiveStar = [
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
    ];

    List<Icon> threeStar = [
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
    ];

    List<Icon> threePointFiveStar = [
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
    ];

    List<Icon> fourStar = [
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
        size: 18,
      ),
    ];

    List<Icon> fourPointFiveStar = [
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 18,
      ),
    ];
    List<Icon> fiveStar = [
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
      Icon(
        Icons.star_rate,
        color: Colors.amber,
        size: 18,
      ),
    ];

    if (rate == 1) {
      stars.addAll(oneStar);
    } else if (rate > 1 && rate < 2) {
      stars.addAll(onePointFiveStar);
    } else if (rate == 2) {
      stars.addAll(twoStar);
    } else if (rate > 2 && rate < 3) {
      stars.addAll(twoPointFiveStar);
    } else if (rate == 3) {
      stars.addAll(threeStar);
    } else if (rate > 3 && rate < 4) {
      stars.addAll(threePointFiveStar);
    } else if (rate == 4) {
      stars.addAll(fourStar);
    } else if (rate > 4 && rate < 5) {
      stars.addAll(fourPointFiveStar);
    } else {
      stars.addAll(fiveStar);
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: stars,
      ),
    );
  }
}
