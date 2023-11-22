import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){}, icon: Icon(
          Ionicons.arrow_back,
          color: Colors.white,)),
        title: Container(
          margin: EdgeInsets.only(left: 80),
          child: Text("Profile",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
          ),),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: [
              SizedBox(
                width: 120, height: 120,
                child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage("assets/chats.gif"),))
              )
            ],
          ),
        ),
      ),
    );
  }
}
