import 'package:flutter/material.dart';

class ChatReceiver extends StatefulWidget {
  const ChatReceiver({super.key});

  @override
  State<ChatReceiver> createState() => _ChatReceiverState();
}

class _ChatReceiverState extends State<ChatReceiver> {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Receiver #34564",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.phone_in_talk,
                      color: Colors.red,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                        itemCount: messages.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Align(
                              alignment:
                                  (messages[index].messageType == "receiver"
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      (messages[index].messageType == "receiver"
                                          ? Colors.red.shade100
                                          : Colors.red),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  messages[index].messageContent,
                                  style:  TextStyle(
                                      fontSize: 15,
                                      color:messages[index].messageType == "receiver"
                                          ? Colors.red
                                          : Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
              ),
              child: Row(
                children: [
                  // TextField(),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            hintText: "Type a message",
                            hintStyle:
                                TextStyle(color: Colors.red, fontSize: 20),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_rounded),
                    color: Colors.red,
                    iconSize: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello shakti", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(messageContent: "Hey Abhay, I am doing fine dude. wbu?",messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(messageContent: "I need Help in flutter", messageType: "receiver"),
  ChatMessage(messageContent: "are you free", messageType: "receiver"),
  ChatMessage(messageContent: "what help?",messageType: "sender"),
  ChatMessage(messageContent: "how to make list items", messageType: "receiver"),
  ChatMessage(messageContent: "To add data to the growable list, use operator[]=, add or addAll. To check whether, and where, the element is in the list, use indexOf or lastIndexOf. To remove an element from the growable list, use remove, removeAt, removeLast, removeRange or removeWhere.", messageType: "sender"),
];

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
