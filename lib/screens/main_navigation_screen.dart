// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:camp_advisor/screens/add_screen.dart';
import 'package:camp_advisor/screens/homeScreen.dart';
import 'package:camp_advisor/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late Position p;
  late String addr;
  bool isLoaded = false;
  List<Widget> screens = [HomeScreen(), ProfileScreen()];
  int selectedindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLoc();

    super.initState();
  }

  getCurrentLoc() async {
    p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        forceAndroidLocationManager: true);
    if (p == null) {
      print("location cannot be fetched");
    } else {
      print("Lat:${p.latitude}\nLong:${p.longitude}");
      List<Placemark> placemarks =
          await placemarkFromCoordinates(p.latitude, p.longitude);
      Placemark place = placemarks[0];
      addr = "${place.name}, ${place.locality}, ${place.postalCode}";
      print(addr);
      setState(() {
        isLoaded = true;
      });
      screens.insert(
        1,
        AddScreen(
          address: addr,
          lat: "${p.latitude}",
          lon: "${p.longitude}",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
          colors: [
            Color(0xff11998e),
            Color(0xff38ef7d),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.09,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.teal.shade900,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "${authServices.firebaseAuth.currentUser!.photoURL}"),
            ),
          ),
          title: Text(
            "Welcome, ${authServices.firebaseAuth.currentUser!.displayName!.substring(0, authServices.firebaseAuth.currentUser!.displayName!.indexOf(" "))}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                await authServices.signOutOfGoogle(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          child: Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                      bottom: -50,
                      left: -400,
                      child: Image(
                        image: AssetImage("images/camp-scenery.png"),
                        // width: 250,
                        // height: 160,
                      )),
                  Positioned(
                    top: -15,
                    left: -20,
                    child: Image(
                      image: AssetImage("images/cloudy.png"),
                      width: 250,
                      height: 160,
                    ),
                  ),
                  Positioned(
                      top: 25,
                      right: 40,
                      child: Image(
                        image: AssetImage("images/birds.png"),
                        width: 60,
                        height: 60,
                      )),
                  Positioned(
                      top: 100,
                      right: -50,
                      child: Image(
                        image: AssetImage("images/cloudy.png"),
                        width: 250,
                        height: 160,
                      )),
                  Positioned(
                      top: 150,
                      left: -50,
                      child: Image(
                        image: AssetImage("images/cloudy.png"),
                        width: 250,
                        height: 160,
                      )),
                  Positioned(
                      top: 320,
                      left: 40,
                      child: Image(
                        image: AssetImage("images/birds.png"),
                        width: 60,
                        height: 60,
                      )),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.teal.withOpacity(0.35),
                  )
                ],
              ),
              screens.elementAt(selectedindex),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 45,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(
            //   topRight: Radius.circular(
            //     25,
            //   ),
            //   topLeft: Radius.circular(
            //     25,
            //   ),
            // ),
            boxShadow: [
              BoxShadow(color: Colors.black45, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            // borderRadius: BorderRadius.only(
            //   topRight: Radius.circular(
            //     25,
            //   ),
            //   topLeft: Radius.circular(
            //     25,
            //   ),
            // ),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (item) {
                setState(() {
                  selectedindex = item;
                });
              },
              selectedFontSize: 0,
              unselectedFontSize: 0,
              iconSize: 40,
              selectedItemColor: Colors.yellowAccent,
              unselectedItemColor: Colors.white70,
              backgroundColor: Color(0xff11998e),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Icon(
                        Icons.add_circle_outline,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Icon(
                        Icons.account_circle,
                      ),
                    ),
                    label: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
