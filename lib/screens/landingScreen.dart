// ignore_for_file: prefer_const_constructors, file_names

import 'package:camp_advisor/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();

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
        body: Stack(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/logo3.png"),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: GestureDetector(
                      onTap: () async {
                        await authServices.signInWithGoogele(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 3)
                          ],
                          //border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/google.png"))),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Sign In using Google",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    // OutlinedButton(
                    //   style: OutlinedButton.styleFrom(
                    //       side: BorderSide(color: Colors.white, width: 2),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(30)))),
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Sign In with Email",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign In using Email",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                    // OutlinedButton(
                    //   style: OutlinedButton.styleFrom(
                    //       side: BorderSide(color: Colors.white, width: 2),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(30)))),
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Sign In with Email",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Don't have an account? Register here",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
