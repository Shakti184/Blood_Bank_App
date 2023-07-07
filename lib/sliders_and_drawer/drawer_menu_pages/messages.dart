import 'package:flutter/material.dart';

import 'chatdoner.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
            "Messages",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ChatDoner())),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide()),
                ),
                child: const ListTile(
                  title: Text(
                    "Doner #12345",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    " Hello I am available",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
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
