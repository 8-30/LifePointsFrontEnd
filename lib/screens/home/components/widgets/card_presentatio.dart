import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/servicio/detalle_servicio_ui.dart';

class CardPresentation extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);
  final PersonaModel persona;
  CardPresentation({
    Key key,
    this.persona,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetalleServicioUI(
                  idPersona: persona.idPersona,
                )),
      ),
      child: Card(
        color: Colors.black54,
        elevation: 8.0,
        child: ListTile(
          leading: Image(
            image: NetworkImage(persona.foto),
          ),
          title:
              Text(persona.nombre + " " + persona.apellido, style: estiloTexto),
          subtitle: Text(persona.direccion + "\n" + "Tarifa: 0.50",
              style: estiloTexto),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
