import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ChatDoner extends StatefulWidget {
  const ChatDoner({super.key});

  @override
  State<ChatDoner> createState() => _ChatDonerState();
}

class _ChatDonerState extends State<ChatDoner> {
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
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.amber,
            ),
            Expanded(
              child: SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.down,
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          const Text('Hey'),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 180,
                              itemBuilder: (context, index) {
                                return const Text('Some text');
                              })
                        ],
                      ),
                    ),
              ),
              ListTile(
                leading:const Text("  Type a message",style: TextStyle(color: Colors.red,fontSize: 30),),
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.send_rounded),color: Colors.red,iconSize: 40,),
                onTap: () {
                  Navigator.pop(context);
                  },
            ),
          ],
        ),
      ),
    );
  }
}