
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praktyki_projekt/auth/main_screen.dart';
import 'package:praktyki_projekt/screens/settings.dart';

class changename extends StatefulWidget {
  const changename({super.key});

  @override
  State<changename> createState() => _changenameState();
}

class _changenameState extends State<changename> {
  @override

  final _formKey  = GlobalKey <FormState>();

  var newName = "";

  final newNameController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  String? firstName = "";
  String? lastName = "";
  String? profileImg = "";
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future<void> getUserName() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((result) async {
      firstName = result.data()?['firstName'];
      lastName = result.data()?['lastName'];
      profileImg = result.data()?['profilePicture'];
    });
  }



  @override
  void dispose() {
  newNameController.dispose();
  super.dispose();
  }

  final currentUser =  FirebaseAuth.instance.currentUser;

  changename() async{
  try {
  await currentUser!.updateDisplayName(newName);
  FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainScreen()));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: Colors.green,
  content: Text('Your name has benn changed.. Login again !'),
  ),);
  }catch (error){}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const settings()),
          );
        }, icon: Icon(
          Ionicons.arrow_back,
          color: Colors.white,)),
        title: Container(
          child: Text("Change Name",
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
                  child: SizedBox(
                    width: 120, height: 120,
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),
                      child:FutureBuilder(
                        future: getUserName(),
                        builder: (_ , AsyncSnapshot snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center( child: CircularProgressIndicator());
                          }
                          return Image.network(
                            profileImg!,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: FutureBuilder(
                    future: getUserName(),
                    builder: (_ , AsyncSnapshot snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center( child: CircularProgressIndicator());
                      }
                      return Text("${firstName} ${lastName}", style:
                      TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 25),);
                    },
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 20),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person_outline,
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
                        hintText: "New Name",
                        hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                      ),
                      controller: newNameController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter name";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 400),
              child: ElevatedButton(onPressed: (){
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    newName = newNameController.text;
                  });
                  changename();
                }
              },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      shape: const StadiumBorder()
                  ),
                  child: const Text("Change", style: TextStyle(color: Colors.white,
                      fontSize: 30),)),
            ),
          ],
        ),
      ),
    );
  }
}
