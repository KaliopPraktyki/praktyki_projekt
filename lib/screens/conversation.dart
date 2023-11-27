import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/components/conversation_bubble.dart';
import 'package:praktyki_projekt/services/conversation_service.dart';

class conversation extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const conversation({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  });

  @override
  State<conversation> createState() => _convetdstionState();
}

class _convetdstionState extends State<conversation> {
  final TextEditingController _messageController = TextEditingController();
  final conversation_service _coversation_service = conversation_service();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _coversation_service.sendMessage(
          widget.receiverUserID, _messageController.text
      );
      _messageController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverUserEmail)),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),

          //user input
          _buildMessageInput(),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  //msg list
  Widget _buildMessageList() {
    return StreamBuilder(stream: _coversation_service.getMessages(widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading..');
        }

        return ListView(
          children: snapshot.data!.docs.map((document) =>
              _buildMessageItem(document)).toList(),
        );
      },
    );
  }

  //msg item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Text(data['senderEmail']),
            const SizedBox(height: 5),
            conversationBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  //msg input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          //textfield
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(hintText: 'send message'),
              obscureText: false,
            ),
          ),

          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              size: 40,),
          )
        ],
      ),
    );
  }
}