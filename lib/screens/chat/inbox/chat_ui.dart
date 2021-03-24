import 'package:flutter/material.dart';
import 'package:life_point/screens/chat/inbox/components/body.dart';

class ChatUI extends StatelessWidget {
  const ChatUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
      ),
      body: ChatBody(),
    );
  }
}
