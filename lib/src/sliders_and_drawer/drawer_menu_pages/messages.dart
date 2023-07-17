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
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ChatDoner())),
              child: Container(
                height: 85,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide()),
                ),
                child: ListTile(
                  title: Text(
                    "Request #${index+1000}",
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    " Hello I am available",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  trailing: const Icon(
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


// web       1:289482632814:web:3ff86a2ae0c4383a76c07f
// android   1:289482632814:android:085333459c1e037576c07f      
// ios       1:289482632814:ios:2a365569d646f06176c07f
// macos     1:289482632814:ios:1fbb8b6e608619e976c07f

