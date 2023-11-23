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
  }

  @override
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
                //first name & last name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      height: 70,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: TextField(
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
                      height: 70,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: TextField(
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
                  height: 70,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                  margin: EdgeInsets.all(12),
                  height: 70,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                    onTap: singUp,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
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

                //new to smooth talk
                SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
