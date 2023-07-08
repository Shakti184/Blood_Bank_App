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
                    height: isDonated?40:30,
                    width: isDonated?180:160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: isDonated ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Donated",
                        style: TextStyle(
                            color: isDonated ? Colors.white : Colors.black,
                            fontSize: isDonated?25:20),
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
                    height: !isDonated?40:30,
                    width: !isDonated?180:160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: !isDonated ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Received",
                        style: TextStyle(
                            color: !isDonated ? Colors.white : Colors.black,
                            fontSize: !isDonated?25:20),
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
                                  child: const ListTile(
                                    title: Text(
                                      "Doner #123",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      " View Details",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                    trailing:Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Receiver ID: #43EQ",style: TextStyle(fontSize: 15),),
                                        Text("Qty: 0.6 ounce",style: TextStyle(fontSize: 15,color: Colors.grey),),
                                      ],
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
                                return GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChatDoner())),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(bottom: BorderSide()),
                                    ),
                                    child: const ListTile(
                                      title: Text(
                                        "Doner #12345",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        " Hello I am available",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
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