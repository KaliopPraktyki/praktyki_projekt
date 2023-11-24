import 'package:flutter/material.dart';

class conversation extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const conversation({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  });

  @override
  State<conversation> createrState() => _conversationState();

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class _conversationState extends State<conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverUserEmail)),
    );
  }
}
