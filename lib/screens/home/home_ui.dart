import 'package:flutter/material.dart';
import 'package:life_point/screens/home/components/body.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME"),
      ),
      body: HomeBody(),
    );
  }
}
