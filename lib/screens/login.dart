import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/screens/forgot_password.dart';

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
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;

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
            child: Form(
              key: _formfield,
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
                    margin: EdgeInsets.all(12),
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter Email";
                        }
                        bool emailValid = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value);
                        if(!emailValid){
                          return "Enter Valid Email";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        labelText: "email", labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.email_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //password textfield
                  Container(
                    margin: EdgeInsets.all(12),
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      obscureText: passToggle,
                      controller: _passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter password";
                        } else if (_passwordController.text.length < 6 ){
                          return "Min. lenght password is 6";
                        }
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        labelText: "password", labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.lock,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),

                    ),
                  ),

                  //button sing in
                  Padding(padding: EdgeInsets.only(top: 10, left: 100, right: 100),
                  child: GestureDetector(
                    onTap: (){
                      if(_formfield.currentState!.validate()){
                      }
                      signIn();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 55, 87, 57),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'SIGN IN',
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
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                              return forgotPasswordScreen();
                          },),);
                      },
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
      ),
    );
  }
}
