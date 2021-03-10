import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/splash/splash_ui.dart';

class CardPresentation extends StatelessWidget {
  final Persona persona;
  const CardPresentation({
    Key key,
    this.persona,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashUI()),
      ),
      child: Card(
        color: Colors.green[100],
        elevation: 8.0,
        child: ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(persona.name),
          subtitle: Text(persona.direction),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
