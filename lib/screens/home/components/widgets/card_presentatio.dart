import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/splash/splash_ui.dart';

class CardPresentation extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);
  final Persona persona;
  CardPresentation({
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
        color: Colors.black54,
        elevation: 8.0,
        child: ListTile(
          leading: Image(
            image: NetworkImage(
                'https://scontent.fuio1-1.fna.fbcdn.net/v/t1.0-1/p160x160/50519850_2202166903161848_8526895222397861888_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=7206a8&_nc_ohc=u3X6xAOvKfsAX-fkJZl&_nc_ht=scontent.fuio1-1.fna&tp=6&oh=50ac2e92fbc4637a8a702ce59744ad98&oe=6074D8D1'),
          ),
          title: Text(persona.name, style: estiloTexto),
          subtitle: Text(persona.direction + "\n" + "Tarifa: 0.50",
              style: estiloTexto),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
