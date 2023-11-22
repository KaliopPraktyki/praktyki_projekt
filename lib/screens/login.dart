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
                    fontSize: 30,
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
            ],
          ),
        ),
      ),
    );
  }
}
