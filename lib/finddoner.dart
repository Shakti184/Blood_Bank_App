import 'package:app/sliders_and_drawer/drawer_menu_pages/requests.dart';
import 'package:flutter/material.dart';

class FindDonersPage extends StatefulWidget {
  const FindDonersPage({super.key});

  @override
  State<FindDonersPage> createState() => _FindDonersPageState();
}

class _FindDonersPageState extends State<FindDonersPage> {
  String dropdownValue = "18";
  bool isfemale=true;

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Patient Blood Type ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "A+",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "A-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "B+",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "B-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "AB+",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "AB-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "A-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "O+",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "O-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Patient Gender",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      isfemale?isfemale=!isfemale:isfemale;
                    }),
                    child: Container(
                      height: 45,
                      width: 110,
                      decoration: BoxDecoration(
                         color: !isfemale? Colors.red:Colors.white,
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(15)),
                            child: Center(child: Text("Male",style: TextStyle(fontSize: 20,color: !isfemale?Colors.white: Colors.black,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      isfemale?isfemale:isfemale=!isfemale;
                    }),
                    child: Container(
                      height: 45,
                      width: 110,
                      decoration: BoxDecoration(
                        color: isfemale? Colors.red:Colors.white,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(15)),
                          child: Center(child: Text("Female",style: TextStyle(fontSize: 20,color:isfemale?Colors.white: Colors.black,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Patient Relation",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(child: Text("Family",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(15)),
                        child: const Center(child: Text("Friend",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(15)),
                        child: const Center(child: Text("other",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Patient Age",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  // Step 1.

// Step 2.
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(15)      
                    ),
                    child: DropdownButton<String>(
                      // Step 3.
                      elevation: 6,
                      iconSize: 40,
                      iconEnabledColor: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      padding: const EdgeInsets.all(5),
                      value: dropdownValue,
                      // Step 4.
                      items: <String>["18", "19", "20", "21","22","23","24","25"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 25),
                          ),
                        );
                      }).toList(),
                      // Step 5.
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: ElevatedButton(
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
                  child: const Text(
                    "             Send Requests             ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
