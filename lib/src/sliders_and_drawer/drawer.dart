import 'package:app/src/authentication/log_sign_in_out/login.dart';
import 'package:app/src/authentication/log_sign_in_out/sign_up.dart';
import 'package:app/src/sliders_and_drawer/drawer_menu_pages/history.dart';
import 'package:app/src/sliders_and_drawer/drawer_menu_pages/messages.dart';
import 'package:app/src/sliders_and_drawer/drawer_menu_pages/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'drawer_menu_pages/requests.dart';

class DrawerSlider extends StatefulWidget {
  const DrawerSlider({super.key});

  @override
  State<DrawerSlider> createState() => _DrawerSliderState();
}

class _DrawerSliderState extends State<DrawerSlider> {
  String image = "assets/images/logoWB.png";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:  const BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(elevation: 10,shadowColor: Colors.red, child: Image.asset(image,filterQuality: FilterQuality.high,),),
                  Text(
                    SignUpPage.username,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    "Donor Status : Approved",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MessagePage()));
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Messages', style: TextStyle(fontSize: 25)),
                        SizedBox(
                          height: 60,
                          child: Image.asset("assets/images/smallarrow1.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/images/line4.png"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RequestPage()));
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Requests', style: TextStyle(fontSize: 25)),
                        SizedBox(
                          height: 60,
                          child: Image.asset("assets/images/smallarrow1.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/images/line4.png"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HistoryPage()));
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('History', style: TextStyle(fontSize: 25)),
                        SizedBox(
                          height: 60,
                          child: Image.asset("assets/images/smallarrow1.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/images/line4.png"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingPage()));
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Settings', style: TextStyle(fontSize: 25)),
                        SizedBox(
                          height: 60,
                          child: Image.asset("assets/images/smallarrow1.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/images/line4.png"),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            child: const Card(
              color: Colors.redAccent,
              shadowColor: Colors.red,
              surfaceTintColor: Colors.white,
              borderOnForeground: true,
              elevation: 15,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "  Sign Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 60,
                        child: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ]),
              ),
            ),
            onTap: () {
              logOut();
            },
          ),
        ],
      ),
    );
  }

  Future<void> logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20,
          backgroundColor: Colors.redAccent,
          title: const Text('Are you sure?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('We will be redirected to login page.',style: TextStyle(color: Colors.white,),),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
                _signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const LogInPage()))); // Navigate to login
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}



// decoration: BoxDecoration(
//                 border: Border.all(color: Colors.red),
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//               ),




          