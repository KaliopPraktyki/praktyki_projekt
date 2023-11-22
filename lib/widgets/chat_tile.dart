import 'package:flutter/material.dart';

class chat_tile extends StatelessWidget {
  final String profileImage;
  final String userName;
  const chat_tile ({
    Key? key,
    required this.userName,
    required this.profileImage,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(profileImage,
          width: 85,
          height: 85,)
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
        Text(userName,
          style:const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
