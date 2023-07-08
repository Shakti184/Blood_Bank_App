import 'package:flutter/material.dart';

import 'chatdoner.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
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
            "Request",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ChatDoner())),
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                child:  ListTile(
                  minVerticalPadding: 0,
                  title: const Text(
                    "Request #1234",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: GestureDetector(
                    child: const Text(
                      "View Details",
                      
                      style: TextStyle(decoration: TextDecoration.underline,fontSize: 15, color: Colors.red),
                    ),
                    onTap:(){} ,
                  ),
                  trailing: Column(
                    children: [
                      Container(
                        height: 24,
                        width: 100,
                        
                        decoration:BoxDecoration(border:Border.all(color: Colors.black),color: Colors.red,borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Text("Accept",style: TextStyle(color: Colors.white,fontSize: 15),),),
                      ),
                      const SizedBox(height: 6,),
                      
                      Container(
                        height: 24,
                        width: 100,
                        
                        decoration:BoxDecoration(border:Border.all(color: Colors.black),color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Text("Reject",style: TextStyle(color: Colors.black,fontSize: 15),),),
                      ),
                    ],
                  ),
                ),
                
              ),
            );
            
          },
        ),
      ),
    );
  }
}
