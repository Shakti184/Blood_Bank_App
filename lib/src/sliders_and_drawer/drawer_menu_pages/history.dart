import 'package:app/details.dart';
import 'package:flutter/material.dart';

import 'chatdoner.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
            " History",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const Donated(),
    );
  }
}

class Donated extends StatefulWidget {
  const Donated({super.key});

  @override
  State<Donated> createState() => _DonatedState();
}

class _DonatedState extends State<Donated> {
  bool isDonated = true;
  void setisDonated() {
    setState(() {
      isDonated = !isDonated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    height: isDonated ? 40 : 30,
                    width: isDonated ? 180 : 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: isDonated ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Donated",
                        style: TextStyle(
                            color: isDonated ? Colors.white : Colors.black,
                            fontSize: isDonated ? 25 : 20),
                      ),
                    ),
                  ),
                  onTap: () => isDonated ? isDonated : setisDonated(),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    height: !isDonated ? 40 : 30,
                    width: !isDonated ? 180 : 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: !isDonated ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Received",
                        style: TextStyle(
                            color: !isDonated ? Colors.white : Colors.black,
                            fontSize: !isDonated ? 25 : 20),
                      ),
                    ),
                  ),
                  onTap: () => !isDonated ? isDonated : setisDonated(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.red,
            ),
            (isDonated)
                ? Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 18,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide()),
                                  ),
                                  child: const Card(
                                    surfaceTintColor: Colors.white,
                                    borderOnForeground: false,
                                    elevation: 0,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Date : 11/08/23",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                " Location : 123, XYZ Apt",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Receiver ID: #43EQ",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                "Qty: 0.6 ounce",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 18,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide()),
                                  ),
                                  child: Card(
                                      surfaceTintColor: Colors.white,
                                      borderOnForeground: false,
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Date : 11/08/23",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  " Location : 123, XYZ Apt",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Receiver ID: #43EQ",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                const Text(
                                                  "Qty: 0.6 ounce",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                                GestureDetector(
                                                  onTap: () => Navigator.of(
                                                          context)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ViewDetailsPage())),
                                                  child: const Text(
                                                    "View Details",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor:
                                                            Colors.red,
                                                        fontSize: 15,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}



// class Received extends StatefulWidget {
//   const Received({super.key});

//   @override
//   State<Received> createState() => _ReceivedState();
// }

// class _ReceivedState extends State<Received> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }