import 'package:flutter/material.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/insumo_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/solicitar_servicio/solicitar_servicio_ui.dart';

class CardPresentation extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);
  final PersonaModel persona;
  final EmpleadoModel empleado;
  final List<InsumoModel> insumos;
  CardPresentation({
    Key key,
    this.persona,
    this.empleado,
    this.insumos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(persona.foto),
                      height: 80,
                      width: 80,
                    ),
                    Text("  "),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(persona.nombre + " " + persona.apellido),
                        Text(persona.genero),
                        Text("Edad: 24"),
                        Text("Telefono: "),
                        Text(persona.telefono),
                      ],
                    ),
                  ],
                ),
                Text("Direccion: "),
                Text(persona.direccion),
                Text("Email: "),
                Text(persona.email),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(empleado.descripcion),
                      Text("\nExtras: "),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: new List.generate(insumos.length,
                          (index) => new Text(insumos[index].nombre + ": ")),
                    ),
                    Column(
                      children: new List.generate(
                          insumos.length,
                          (index) =>
                              new Text(insumos[index].tarifa.toString())),
                    )
                  ],
                ),
                Text(""),
                RaisedButton(
                  child: Text("Solicitar Servicio"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.green[400],
                  elevation: 5.0,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SolicitarServicioUI()),
                  ),
                )
              ],
            )));
  }
}
