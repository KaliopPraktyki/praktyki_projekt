import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/screens/conversation.dart';

import '../screens/chat.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({super.key});

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
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
            scrollDirection: Axis.vertical,
            child: Column(
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

    if(_auth.currentUser!.email != data['email']){
      return GestureDetector(
        child: Row(
          children: [
            SizedBox(height: height*0.12,),

            Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(profileImage,
                      width: 85,
                      height: 85,
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
                                  width: 15,
                                  height: 15,
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
                                  "assets/offline.png",
                                  width: 15,
                                  height: 15,
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

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['firstName']+" "+ data['lastName'],
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 10,),
                Text("last message",
                  style:const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Column(

              children: [

                Text(
                  "time",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),
                ),

                const SizedBox(width: 20,height: 10,),

                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 55, 86, 56)
                  ),

                  child: Align(
                    alignment: Alignment.center,
                    child: Text("numberOffUnreadMessages",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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



