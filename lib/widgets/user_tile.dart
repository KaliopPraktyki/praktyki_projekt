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
          return ListView(
              shrinkWrap: true,
              children:
            snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),

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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(profileImage,
              width: 85,
              height: 85,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
            Text(data['firstName']+" "+data['lastName'],
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



