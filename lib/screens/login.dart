import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //logo
              SizedBox(height: 40,),
              Image.asset('assets/logoWithoutBackground.png',
              scale: 2.2,),

              SizedBox(height: 20,),
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
              Container(
                margin: EdgeInsets.all(20),
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    border: InputBorder.none,
                    hintText: "Login",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.email_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
