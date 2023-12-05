import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/widgets/chat_tile.dart';
import 'package:praktyki_projekt/widgets/user_tile.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praktyki_projekt/screens/settings.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

String profileImage = "assets/logo.png";


class _chatState extends State<chat> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const settings()),);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(profileImage,
                    width: 50,
                    height: 50,)
              ),
            ),
            Text("Chats",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey),
              ),
              child: Icon(Ionicons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body:SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
                SizedBox(height: height*0.02,),
                SearchAnchor(
                  builder: (BuildContext context, SearchController controller){
                    return SearchBar(
                      hintText: "Search",
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16)),
                      onTap: (){
                        controller.openView();
                      },
                      onChanged: (_){
                        controller.openView();
                      },
                      leading: const Icon(Ionicons.search,
                        color: Colors.grey,
                      ),
                    );
                  },
                  suggestionsBuilder:(BuildContext context, SearchController controller){
                    return List<ListTile>.generate(5, (int index){
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: (){
                          setState(() {
                            controller.closeView(item);
                          },
                          );
                        },
                      );
                    },
                    );
                  },
                ),
              SizedBox(height: height*0.02,),
              UserTile(),
              ChatTile(),
            ],
          ),
        ),
      ),
    );
  }
}
