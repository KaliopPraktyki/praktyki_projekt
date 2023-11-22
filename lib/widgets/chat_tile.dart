import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String lastMessage;
  final String time;
  final String numberOffUnreadMessages;
  const ChatTile ({
    Key? key,
    required this.userName,
    required this.profileImage,
    required this.lastMessage,
    required this.time,
    required this.numberOffUnreadMessages,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            const SizedBox(width: 10,height: 100,),

            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(profileImage,
                  width: 70,
                  height: 70,)
            ),

            const SizedBox(width: 10),

            Column(
              children: [
                Text(userName,
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 10,),
                Text(lastMessage,
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
                const SizedBox(width: 90),

                Text(
                  time,
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
                    child: Text(numberOffUnreadMessages,
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
    );
  }
}
