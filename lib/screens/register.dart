import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registerScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const registerScreen({
   Key? key,
    required this.showLoginScreen,
  }) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;


  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future singUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
    addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
    );

  }

  Future addUserDetails(String firstName, String lastName, String email,) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userId': userId,
      'profilePicture': "https://firebasestorage.googleapis.com/v0/b/smooth-talk-ececa.appspot.com/o/logo.png?alt=media&token=0c4f08a9-b2ae-4a32-a4c0-b3a3c9ad080d",
      'isActive': "",
      'status': "",
    });
  }

  @override
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
                      Text('Register',
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
                      Text('Please sign up to continue',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),),
                    ],
                  ),

                  SizedBox(height: 10,),
                  //first name & last name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(12),
                        height: 80,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _firstNameController,
                          validator: (value){
                            if(value!.isEmpty) {
                              return "Enter first name";
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                            border: InputBorder.none,
                            hintText: "first name",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              
                      Container(
                        margin: EdgeInsets.all(12),
                        height: 80,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _lastNameController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter last name";
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                            border: InputBorder.none,
                            hintText: "last name",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
                  Padding(padding: EdgeInsets.only(top: 20, left: 100, right: 100),
                    child: GestureDetector(
                      onTap: (){
                        if(_formfield.currentState!.validate()){

                        }
                        singUp();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 55, 87, 57),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'SING UP',
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
                      Text('Already have an account? ',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),),
                      GestureDetector(
                        child: Text('Sing In',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 55, 87, 57),
                          ),),
                        onTap: widget.showLoginScreen,
                      ),
                    ],
                  ),
              
                  SizedBox(height: 10,),
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
