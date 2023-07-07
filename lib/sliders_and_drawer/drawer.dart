import 'package:app/sliders_and_drawer/drawer_menu_pages/history.dart';
import 'package:app/sliders_and_drawer/drawer_menu_pages/messages.dart';
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
                children:   [
                  SizedBox(width: 86, height: 82, child: Image.asset(image)),
                  const Text(
                    "Donor #32457",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    "Donor Status : Approved",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
              trailing: Image.asset("assets/images/smallarrow1.png"),
              title: const Text(' Messages ',style:TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MessagePage()));
              },
            ),
            Image.asset("assets/images/line4.png"),
            ListTile(
              trailing: Image.asset("assets/images/smallarrow1.png"),
              title: const Text(' Requests ',style:TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RequestPage()));
              },
            ),
            Image.asset("assets/images/line4.png"),
            ListTile(
              trailing: Image.asset("assets/images/smallarrow1.png"),
              title: const Text(' History ',style:TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HistoryPage()));
              },
            ),
            Image.asset("assets/images/line4.png"),
            ListTile(
              trailing: Image.asset("assets/images/smallarrow1.png"),
              title: const Text(' Settings ',style:TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MessagePage()));
              },
            ),
            Image.asset("assets/images/line4.png"),
            const SizedBox(height: 100,),
            GestureDetector(
              child: Row(
                children: [
                const SizedBox(width: 50,),
                const Text("  Sign Out",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.red,fontSize: 30),),
                Expanded(child: Container()),
                const Icon(Icons.logout_outlined,color: Colors.red,),
                const SizedBox(width: 60,),
              ]),
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




          