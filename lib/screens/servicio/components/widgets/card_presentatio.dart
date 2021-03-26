import 'package:flutter/material.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/insumo_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/Inbox/inbox_repository.dart';
import 'package:life_point/screens/chat/inbox/chat_ui.dart';
import 'package:life_point/screens/solicitar_servicio/solicitar_servicio_ui.dart';

class CardPresentation extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);
  final PersonaModel persona;
  final EmpleadoModel empleado;
  final List<InsumoModel> insumos;
  InboxRepository _inboxRepository = InboxRepository();
  CardPresentation({
    Key key,
    this.persona,
    this.empleado,
    this.insumos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Direccion: "),
                      RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [TextSpan(text: persona.direccion)])),
                      Text("Email: "),
                      Text(persona.email),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("\nServicio: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Descripcion: "),
                      RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                            TextSpan(text: empleado.descripcion)
                          ])),
                      Text("Tarifa por Hora: "),
                      Text(empleado.tarifa.toString() + "\$"),
                      Text("Empresa: " + empleado.empresa),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("\nInsumos Extras: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: new List.generate(insumos.length,
                            (index) => new Text(insumos[index].nombre + ": ")),
                      ),
                      Column(
                        children: new List.generate(
                            insumos.length,
                            (index) => new Text(
                                insumos[index].tarifa.toString() + "\$")),
                      )
                    ],
                  ),
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
                    onPressed: () async => {
                          //esto va en otro boton, por mientras esta aqui
                          print("sss"),
                          await _inboxRepository.postInbox(
                              persona.idPersona, 1),
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChatUI(idPersona: persona.idPersona)),
                          ),
                        })
              ],
            )));
  }
}
