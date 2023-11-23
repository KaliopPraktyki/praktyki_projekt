import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/screens/chat.dart';
import 'package:praktyki_projekt/screens/login.dart';
import 'package:praktyki_projekt/screens/conversation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:praktyki_projekt/screens/settings.dart';


void main() async {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Talk',
      theme: ThemeData(
        fontFamily: 'Spoof',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 33),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home: loginScreen(),

    );
  }
}



