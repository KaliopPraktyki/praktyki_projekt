import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  final VoidCallback showRegisterScreen;
  const loginScreen({Key? key,required  this.showRegisterScreen}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //logo
                Image.asset('assets/logoWithoutBackground.png',
                scale: 1.5,),

                SizedBox(height: 5,),
                //Text Login
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Text('Login',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),),
                  ],
                ),
                //Please sign in to continue
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Text('Please sign in to continue',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                      ),),
                  ],
                ),

                //email textfield
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

                //password textfield
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
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      border: InputBorder.none,
                      hintText: "password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.lock,
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

                //button sing in
                Padding(padding: EdgeInsets.only(top: 20, left: 100, right: 100),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 55, 87, 57),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'SING IN',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ),

                //forgot password
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forgot Password? ',
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
                    onTap: null,
                    ),
                  ],
                ),

                //new to smooth talk
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New to Smooth Talk? ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),),
                    GestureDetector(
                      child: Text('Create an account',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 55, 87, 57),
                        ),),
                      onTap: widget.showRegisterScreen,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
