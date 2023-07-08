import 'package:app/sliders_and_drawer/drawer.dart';
import 'package:app/sliders_and_drawer/drawer_menu_pages/requests.dart';
import 'package:flutter/material.dart';
import 'finddoner.dart';
import 'log_sign_in_out/otp_verify.dart';

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
      
        title: const Text("Blood Bank App",style: TextStyle(color: Colors.white,fontSize: 30),),
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
                        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 110),
                        child: Text("Hello Shakti",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
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
                        Container(
                          height: 268,
                          width: 159,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(" Your Blood Group ",style:TextStyle(fontSize: 18)),
                              const SizedBox(height: 30,),
                              Stack(
                                children: <Widget>[
                                  Image.asset("assets/images/union1.png"),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(18, 40, 0, 0),
                                    child: Text("A+",style:TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.white)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40,),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(width: 20),
                        ),
                        Container(
                          height: 268,
                          width: 159,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(" Doner Status ",style:TextStyle(fontSize: 18)),
                              const SizedBox(height: 30,),
                              Image.asset("assets/images/group3.png",width: 120,height: 120,),
                              const SizedBox(height: 20,),
                              const Text(" You can Donate! ",style:TextStyle(fontSize: 18,color: Colors.grey)),

                            ],
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 100,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.redAccent, //background color of button
                          elevation: 2, //elevation of button
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
                      child: const Text(
                        "               Find Donors              ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.redAccent, //background color of button
                          elevation: 2, //elevation of button
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(20)
                          ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const RequestPage())));
                      },
                      child: const Text("             Donate Blood             ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
