import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praktyki_projekt/screens/settings.dart';

class changepassword extends StatefulWidget {
  const changepassword({super.key});

  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => const settings()),
        );
        }, icon: Icon(
          Ionicons.arrow_back,
          color: Colors.white,)),
        title: Container(
          child: Text("Change Password",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,

            ),),
        ),
      ),


    );
  }
}
