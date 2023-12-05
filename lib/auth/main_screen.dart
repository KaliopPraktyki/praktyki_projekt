import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/auth/auth_screen.dart';
import 'package:praktyki_projekt/auth/verify_email.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
              return VerifyEmailPage();
          } else {
              return authScreen();
          }
        },
      ),
    );
  }
}
