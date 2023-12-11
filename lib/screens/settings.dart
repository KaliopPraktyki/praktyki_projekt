import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praktyki_projekt/auth/main_screen.dart';
import 'package:praktyki_projekt/model/utils.dart';
import 'package:praktyki_projekt/resources/add_data.dart';
import 'package:praktyki_projekt/screens/change_name.dart';
import 'package:praktyki_projekt/screens/change_password.dart';
import 'package:praktyki_projekt/screens/chat.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
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
      isActive = result.data()?['isActive'] ?? false;
    });
  }



  Future<void> updateActiveStatus(bool isActive) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'isActive': isActive})
        .then((_) {
      print('Active status updated successfully');
    }).catchError((error) {
      print('Error updating active status: $error');
    });
  }

  bool isActive = false;

  Uint8List? _image;

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String resp = await StorageData().saveData(file: _image!);
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context,
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                         onTap: selectImage,
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
              const SizedBox(height: 20,),

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: isActive ? Colors.green : Colors.red, // Change color based on isActive
                  ),
                ),
                title: Text(
                  "Active status",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                      updateActiveStatus(isActive);
                    });
                  },
                ),
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
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  child: const Icon(Ionicons.save_outline,
                    color: Colors.white,
                    size: 45,),
                ),
                title: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: (){
                      saveProfile();
                      },
                    child: Text("Save profile picture", style: TextStyle(fontSize: 20,
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
