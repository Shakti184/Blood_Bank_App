import 'package:app/sliders_and_drawer/drawer_menu_pages/history.dart';
import 'package:app/sliders_and_drawer/drawer_menu_pages/messages.dart';
import 'package:app/sliders_and_drawer/drawer_menu_pages/settings.dart';
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
            decoration: const BoxDecoration(
              color: Color.fromARGB(181, 255, 82, 82),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 86, height: 82, child: Image.asset(image)),
                  const Text(
                    "Donor #32457",
                    style: TextStyle(
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
              margin: EdgeInsets.only(left: 30,right: 30),
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
                        fontSize: 30
                        ),
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}



// decoration: BoxDecoration(
//                 border: Border.all(color: Colors.red),
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//               ),




          