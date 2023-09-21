import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_provider/Screens/Home_screen.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Login_Pages/Login.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 210, bottom: 40, left: 40, right: 40),
                      child: Image.asset(
                        "assets/shop_images/fresh_meat.jpeg",
                        height: 200,
                        width: 300,
                      ),
                    ),
                    Positioned(
                        top: 370,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            "We Provide Fresh Meats to your Doorsteps.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )),
                    Positioned(
                      top: 400,
                      left: 110,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.brown),
                          child: Center(
                              child: Text(
                            "GET STARTED",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
