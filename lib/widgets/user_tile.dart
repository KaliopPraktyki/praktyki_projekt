import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/screens/chat.dart';
import 'package:praktyki_projekt/screens/conversation.dart';

class UserTile extends StatefulWidget {
  const UserTile({super.key});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return _buildUserList();
  }
  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Text("Error");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text("Loading...");
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
              snapshot.data!.docs
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList(),

            ),
          );
        }
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;


    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? profileImg = "";
    if(data['profilePicture'] != ""){
      profileImg = data['profilePicture'];
    }else{
      profileImg = "https://firebasestorage.googleapis.com/v0/b/smooth-talk-ececa.appspot.com/o/logo.png?alt=media&token=0c4f08a9-b2ae-4a32-a4c0-b3a3c9ad080d";
    }
    if(_auth.currentUser!.email != data['email']){
      return GestureDetector(
        child: Column(
          children: [
            SizedBox(width: width*0.25,),
            Stack(
              children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(profileImg!,
                  width: width*0.2,
                ),
              ),StreamBuilder<DocumentSnapshot>(
                  stream: _firestore.collection("users").doc(data['userId']).snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      if(data['status']=="online"){
                        return Positioned(
                          right: 7,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(50)),
                            child: Image.asset(
                              "assets/online.png",
                              width: width*0.03,
                            ),
                          ),
                        );
                      }else{
                        return Positioned(
                          right: 7,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(50)),
                            child: Image.asset(
                              "assets/online.png",
                              width: width*0.03,
                            ),
                          ),
                        );
                      }
                    }else{
                      return Container();
                    }
                  }),
              ]
            ), 
            SizedBox(height: height*0.001,),
            Text(data['firstName'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),)
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> conversation(
            receiverUserName: data['firstName']+" "+ data['lastName'],
            receiverUserID: data['userId'],
          )));
        },
      );
    }
    else{
      return Container();
    }
  }
}



