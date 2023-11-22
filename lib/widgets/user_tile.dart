import 'package:flutter/material.dart';

class user_tile extends StatelessWidget {
  final Image profileImage;
  final String userName;
  const user_tile({
    Key? key,
    required this.userName,
    required this.profileImage,
   }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: profileImage,
        )
      ],
    );
  }
}

