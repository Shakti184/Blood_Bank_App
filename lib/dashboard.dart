import 'package:app/src/authentication/log_sign_in_out/sign_up.dart';
import 'package:app/src/sliders_and_drawer/drawer.dart';
import 'package:app/src/sliders_and_drawer/drawer_menu_pages/requests.dart';
import 'package:flutter/material.dart';
import 'finddoner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = SignUpPage.username;
  bool isadult = SignUpPage.isadult;
  String bloodType = SignUpPage.bloodtype;
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
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hello ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.white),
                          ),
                          Text(
                            userName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.white),
                          ),
                        ],
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
                          elevation: 8,
                          shadowColor: const Color.fromARGB(255, 239, 122, 122),
                          surfaceTintColor: Colors.white,
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
                                          width: 160,
                                          height: 152,
                                        ),
                                        Center(
                                          child: Text(
                                            bloodType,
                                            style: const TextStyle(
                                                fontSize: 50,
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
                        isadult
                            ? Card(
                                elevation: 8,
                                shadowColor:
                                    const Color.fromARGB(255, 239, 122, 122),
                                surfaceTintColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                        width: 140,
                                        child: Center(
                                            child: Text(" Doner Status ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500))),
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
                                                fontSize: 18,
                                                color: Colors.grey)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Card(
                                elevation: 8,
                                shadowColor:
                                    const Color.fromARGB(255, 239, 122, 122),
                                surfaceTintColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                        width: 140,
                                        child: Center(
                                            child: Text(" Doner Status ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500))),
                                      ),
                                      SizedBox(
                                          height: 160,
                                          width: 140,
                                          child: Image.asset(
                                            "assets/images/redcross.png",
                                            width: 120,
                                            height: 120,
                                          )),
                                      const SizedBox(
                                        height: 42,
                                        width: 140,
                                        child: Text(
                                          " Not Eligible ! ",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shadowColor: const Color.fromARGB(255, 239, 122,
                                122), //background color of button
                            elevation: 8, //elevation of button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(20)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const FindDonersPage())));
                        },
                        child: const Center(
                          child: Text(
                            "Find Blood",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor:
                                const Color.fromARGB(255, 239, 122, 122),
                            backgroundColor:
                                Colors.redAccent, //background color of button
                            elevation: 8, //elevation of button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(20)),
                        onPressed: () {
                         isadult? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const RequestPage()))):notEligileUser();
                        },
                        child: const Center(
                          child: Text(
                            "Donate Blood",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> notEligileUser() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20,
          backgroundColor: Colors.redAccent,
          title: const Text(
            'You are Not eligible',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'You can not donate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
          ],
        );
      },
    );
  }
}
