import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktyki_projekt/widgets/chat_tile.dart';
import 'package:praktyki_projekt/widgets/user_tile.dart';
import 'package:ionicons/ionicons.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}
String profileImage = "assets/logo.png";

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height: 130,width: 10,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(profileImage,
                      width: 70,
                      height: 70,)
                ),
                SizedBox(width: 100),
                Text("Chats",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),
                ),
                Spacer(),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Icon(Ionicons.add,
                    color: Colors.white,
                  ),
                ),
               
                const SizedBox(width: 10,),
              ],
            ),
             Row(
              children: [
               SearchAnchor(
                   builder: (BuildContext context, SearchController controller){
                     return SearchBar(
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
                           });
                         },
                       );
                     }
                     );
                   }
                   ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
