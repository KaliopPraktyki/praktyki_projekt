import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praktyki_projekt/auth/main_screen.dart';
import 'package:praktyki_projekt/main.dart';
import 'package:praktyki_projekt/screens/change_name.dart';
import 'package:praktyki_projekt/screens/change_password.dart';
import 'package:praktyki_projekt/screens/chat.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const chat()),
          );
        },
            icon: Icon(
          Ionicons.arrow_back,
          color: Colors.white,)),
        title: Container(
          margin: EdgeInsets.only(left: 45),
          child: Text("Settings",
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,

          ),),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    SizedBox(
                      width: 120, height: 120,
                      child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset("assets/logoWithoutBackground.png"),),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        // onTap: ,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),),
                          child: const Icon(Ionicons.camera,
                          color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ),
              const SizedBox(height: 10,),
              Center(
                child: Text("Mateusz Omilian",style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),),
              ),
              const SizedBox(height: 20,),

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,
                  ),
                  child: const Icon(Ionicons.ellipse_outline,
                  color: Colors.green,),
                ),
                title: Text("Active status", style: TextStyle(fontSize: 20
                    ,
                color: Colors.white),),

              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  child: const Icon(Ionicons.person_outline,
                    color: Colors.white,
                    size: 45,),
                ),
                title: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const changename()),);
                    },
                    child: Text("Change name", style: TextStyle(fontSize: 20,
                        color: Colors.white),),
                  ),
                ),
              ),
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: const Icon(Ionicons.lock_closed_outline,
              color: Colors.white,
              size: 45,),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const changepassword()),
              );},
              child: Text("Change password", style: TextStyle(fontSize: 20,
                  color: Colors.white),),
            ),
          ),),
              SizedBox(height: 200,),
              SizedBox(
                width: 300,
                height: 50,
                child: TextButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainScreen()));
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: const StadiumBorder()
                    ),
                    child: GestureDetector(
                      onTap: (){
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainScreen()));
                      },
                      child: const Text("Log out", style: TextStyle(color: Colors.red,
                      fontSize: 30),),
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
