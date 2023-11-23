import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'chat.dart';

class conversation extends StatefulWidget {
  const conversation({super.key});

  @override
  State<conversation> createState() => _conversationState();
}

class _conversationState extends State<conversation> {

  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 32, 33),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(
              color: Colors.white,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const chat()));
              },),
            CircleAvatar(
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text("online", style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
      body: Chat(messages: _messages, onSendPressed: _handleSendPressed, user: _user),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "id",
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}

