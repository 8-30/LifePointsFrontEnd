import 'package:flutter/material.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/servicio/components/widgets/card_presentatio.dart';

class ServicioBody extends StatelessWidget {
  const ServicioBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: CardPresentation(
            persona: PersonaModel(
                nombre: "Daniel",
                apellido: "Lopez",
                direccion: "Hernan GMoiner Pasaje 13",
                telefono: "0979169244",
                genero: "Masculino",
                nacimiento: DateTime.now(),
                foto:
                    'https://scontent.fuio1-1.fna.fbcdn.net/v/t1.0-9/50519850_2202166903161848_8526895222397861888_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=-GjsPnq-UHYAX_xlMpC&_nc_ht=scontent.fuio1-1.fna&oh=9ed968b13aa96463eae49c45b3571214&oe=6076B0EC',
                credencial: "",
                email: "drlopez2@espe.edu.ec"),
            empleado: EmpleadoModel(
                tarifa: 0.50,
                descripcion:
                    "Soy pro en League of legends y en valornt tambien")),
      ),
    );
  }
}
