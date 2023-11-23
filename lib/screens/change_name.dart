import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praktyki_projekt/screens/settings.dart';

class changename extends StatefulWidget {
  const changename({super.key});

  @override
  State<changename> createState() => _changepasswordState();
}

class _changepasswordState extends State<changename> {
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
          child: Text("Change Name",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,

            ),),
        ),
      ),
      body: Positioned(
    child: Column(
    children: [
    Container(
    margin: EdgeInsets.only(top: 20,),
    child: TextField(
    decoration: InputDecoration(
    icon: Icon(
    Icons.person,
    color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    contentPadding: EdgeInsets.all(10),
    hintText: "Name",
    hintStyle: TextStyle(fontSize: 14,color: Colors.white),
    ),
    ),
    ),
    Container(
    margin: EdgeInsets.only(top: 20,),
    child: TextField(
    decoration: InputDecoration(
    icon: Icon(
    Icons.person_outline,
    color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    contentPadding: EdgeInsets.all(10),
    hintText: "Surname",
    hintStyle: TextStyle(fontSize: 14,color: Colors.white),
    ),
    ),
    ),
    Container(
    margin: EdgeInsets.only(top: 20),
    child: TextField(
    decoration: InputDecoration(
    icon: Icon(
    Icons.lock,
    color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    contentPadding: EdgeInsets.all(10),
    hintText: "Password",
    hintStyle: TextStyle(fontSize: 14,color: Colors.white),
    ),
    ),
    ),
      SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                side: BorderSide.none,
                shape: const StadiumBorder()
            ),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: const Text("Change", style: TextStyle(color: Colors.green,
                  fontSize: 30),),
            )),
      ),
    ],
      ),
      ),
    );
  }
}
