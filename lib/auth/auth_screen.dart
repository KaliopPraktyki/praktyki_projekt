import 'package:flutter/material.dart';
import 'package:praktyki_projekt/screens/login.dart';
import 'package:praktyki_projekt/screens/register.dart';

class authScreen extends StatefulWidget {
  const authScreen({super.key});

  @override
  State<authScreen> createState() => _authScreenState();
}

class _authScreenState extends State<authScreen> {

  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return loginScreen(showRegisterScreen: toggleScreens);
    }else {
      return registerScreen(showLoginScreen: toggleScreens);
    }
  }
}
