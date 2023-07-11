import 'package:app/sliders_and_drawer/drawer.dart';
import 'package:app/sliders_and_drawer/drawer_menu_pages/requests.dart';
import 'package:flutter/material.dart';
import 'finddoner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      drawer: const DrawerSlider(),
      appBar: AppBar(
      leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
        title: const Text(
          "Blood Bank App",
          style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.red,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 110),
                        child: Text(
                          "Hello SHAKTI",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 160, 20, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          elevation: 13,
                          shadowColor: Colors.red,
                          surfaceTintColor: Colors.white,
                          // height: 268,
                          // width: 159,
                          // decoration: const BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20))
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 62,
                                  width: 140,
                                  child: Center(
                                    child: Text(" Your Blood Group",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                SizedBox(
                                  height: 180,
                                  width: 140,
                                  child: Center(
                                    child: Stack(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/union1.png",
                                          width: 140,
                                          height: 162,
                                        ),
                                        const Center(
                                          child: Text(
                                            "A+",
                                            style: TextStyle(
                                                fontSize: 62,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(width: 20),
                        ),
                        Card(
                          elevation: 13,
                          shadowColor: Colors.red,
                          surfaceTintColor: Colors.white,
                          // height: 268,
                          // width: 159,
                          // decoration: const BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20))
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: Center(
                                      child: Text(" Doner Status ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500))),
                                ),
                                SizedBox(
                                    height: 160,
                                    width: 120,
                                    child: Image.asset(
                                      "assets/images/group3.png",
                                      width: 120,
                                      height: 120,
                                    )),
                                const SizedBox(
                                  height: 42,
                                  width: 140,
                                  child: Text(" You can Donate! ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.redAccent, //background color of button
                          elevation: 10, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(
                              20) //content padding inside button
                          ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const FindDonersPage())));
                      },
                      child: const SizedBox(
                        width: 200,
                        height: 30,
                        child: Center(
                          child: Text(
                            "Find Doner",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.redAccent, //background color of button
                          elevation: 10, //elevation of button
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const RequestPage())));
                      },
                      child: const SizedBox(
                        width: 200,
                        height: 30,
                        child: Center(
                          child: Text(
                            "Donate Blood",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
