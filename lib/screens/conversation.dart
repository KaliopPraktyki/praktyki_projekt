import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:praktyki_projekt/screens/chat.dart';

class conversation extends StatelessWidget {
  const conversation({super.key});

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
    );
  }
}