import 'package:flutter/material.dart';
import 'package:praktyki_projekt/screens/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Spoof",
        scaffoldBackgroundColor: Color.fromARGB(255, 32, 32, 33)
      ),
      debugShowCheckedModeBanner: false,
      home: chat(),
    );
  }
}



