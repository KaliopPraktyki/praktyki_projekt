
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praktyki_projekt/auth/main_screen.dart';
import 'package:praktyki_projekt/main.dart';
import 'package:praktyki_projekt/screens/settings.dart';

class changepassword extends StatefulWidget {
    const changepassword({super.key});

  @override
  State<changepassword> createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  @override

  final _formKey  = GlobalKey <FormState>();

  var newPassword = "";

  final newPasswordController = TextEditingController();

  bool _passwordVisible = false;

  void initState() {
    _passwordVisible;
  }


  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser =  FirebaseAuth.instance.currentUser;

  changepassword() async{
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text('Your passwod has benn changed.. Login again !'),
      ),);
    }catch (error){

    }
  }


  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => const settings()),
        );
        }, icon: Icon(
          Ionicons.arrow_back,
          color: Colors.white,)),
        title: Container(
          child: Text("Change Password",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,

            ),),
        ),
      ),
      body: Positioned(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Form(
                    key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "New Password",
                      hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                    ),
                    obscureText: !_passwordVisible,
                    controller: newPasswordController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter Password";
                      }
                      return null;
                    },
                  ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(onPressed: (){
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    newPassword = newPasswordController.text;
                  });
                  changepassword();
                }
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: const StadiumBorder()
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: const Text("Change", style: TextStyle(color: Colors.green,
                        fontSize: 30),),
                  )),
            ),
          ],
        ),
      ),

    );

  }

}
