import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/auth/main_screen.dart';
import 'package:praktyki_projekt/screens/login.dart';

class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({super.key});

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text("Password reset link sent! Check your email"),
        );
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
            content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Enter your email and we will send you a new password reset link"),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    border: InputBorder.none,
                    hintText: "email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.email_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10, left: 90, right: 90),
                child: GestureDetector(
                  onTap: (){
                    passwordReset();
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 55, 87, 57),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Reset password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do you want to log in? ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),),
                  GestureDetector(
                    child: Text('Click here',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 55, 87, 57),
                      ),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return mainScreen();
                      },),);
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
