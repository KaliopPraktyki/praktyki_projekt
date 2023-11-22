import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/logo.png",
              width: 85,
              height: 85,),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 7)),
            const Text("User name",
            style:TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
            ),
          ],

        )

      ),
    );
  }
}
