import 'package:flutter/material.dart';


class DataBsae extends StatefulWidget {
  const DataBsae({super.key});

  @override
  State<DataBsae> createState() => _DataBsaeState();
}

class _DataBsaeState extends State<DataBsae> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: const Text("insert",style: TextStyle(fontSize: 20),)),
          ElevatedButton(onPressed: (){}, child: const Text("query",style: TextStyle(fontSize: 20),)),
          ElevatedButton(onPressed: (){}, child: const Text("updata",style: TextStyle(fontSize: 20),)),
          ElevatedButton(onPressed: (){}, child: const Text("delete",style: TextStyle(fontSize: 20),)),
          ElevatedButton(onPressed: (){}, child: const Text("insert",style: TextStyle(fontSize: 20),)),
        ],
      )),
    );
  }
}