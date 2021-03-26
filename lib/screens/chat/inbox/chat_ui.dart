import 'package:flutter/material.dart';
import 'package:life_point/screens/chat/inbox/components/body.dart';

class ChatUI extends StatelessWidget {
  final int idPersona;
  const ChatUI({Key key, this.idPersona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
      ),
      body: ChatBody(idPersona: idPersona),
    );
  }
}