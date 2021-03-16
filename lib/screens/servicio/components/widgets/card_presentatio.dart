import 'package:flutter/material.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/person_model.dart';

class CardPresentation extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);
  final PersonaModel persona;
  final EmpleadoModel empleado;
  CardPresentation({
    Key key,
    this.persona,
    this.empleado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        /*child: Card(
      color: Colors.black54,
      child: ListTile(
          leading: Image(
            image: NetworkImage(persona.foto),
          ),
          title:
              Text(persona.nombre + " " + persona.apellido, style: estiloTexto),
          subtitle: Text(
              persona.direccion +
                  "\n" +
                  "Tarifa: " +
                  empleado.tarifa.toString(),
              style: estiloTexto),
          trailing: Icon(Icons.arrow_forward_ios),
        ),

    )*/
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: NetworkImage(persona.foto),
              height: 100,
              width: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(persona.nombre + " " + persona.apellido),
                Text(persona.genero),
                Text("Tarifa:" + empleado.tarifa.toString()),
                Text("Telefono: "),
                Text(persona.telefono),
                Text("Direccion: "),
                Text(persona.direccion),
                Text("Email: "),
                Text(persona.email),
              ],
            ),
          ],
        ),
        Text(empleado.descripcion)
      ],
    ));
  }
}
