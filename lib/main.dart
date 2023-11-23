import 'package:firebase_core/firebase_core.dart';
import 'package:praktyki_projekt/screens/main_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: mainScreen(),

    );
  }
}



