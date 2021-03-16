import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/home/components/widgets/card_presentatio.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return CardPresentation(
              persona: PersonaModel(
                  nombre: "Daniel",
                  apellido: "Lopez",
                  direccion: "Jugador de LoL",
                  telefono: "0979169244",
                  genero: "Masculino",
                  foto:
                      'https://scontent.fuio1-1.fna.fbcdn.net/v/t1.0-9/50519850_2202166903161848_8526895222397861888_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=-GjsPnq-UHYAX_xlMpC&_nc_ht=scontent.fuio1-1.fna&oh=9ed968b13aa96463eae49c45b3571214&oe=6076B0EC',
                  credencial: "",
                  email: "danielpro@gmail.com"),
            );
          },
        ),
      ),
    );
  }
}
