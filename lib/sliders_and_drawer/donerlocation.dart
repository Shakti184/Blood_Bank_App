import 'package:app/sliders_and_drawer/drawer_menu_pages/requests.dart';
import 'package:flutter/material.dart';

class DonersLocationPage extends StatefulWidget {
  const DonersLocationPage({super.key});

  @override
  State<DonersLocationPage> createState() => _DonersLocationPageState();
}

class _DonersLocationPageState extends State<DonersLocationPage> {

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            "Find Doner",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text("Donors in your location are :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 300,width: 500,
                child: Image(image: AssetImage("assets/images/map1.png",)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.redAccent, //background color of button
                    elevation: 2, //elevation of button
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(20)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const RequestPage())));
                },
                child:const Center(
                  child: Text(
                    "Communicate",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
