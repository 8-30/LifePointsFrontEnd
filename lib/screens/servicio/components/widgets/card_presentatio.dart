import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/controllers/home/home_controller.dart';
import 'package:life_point/models/insumo_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/Inbox/inbox_repository.dart';
import 'package:life_point/screens/chat/inbox/chat_ui.dart';

class CardPresentation extends StatefulWidget {
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
  _CardPresentationState createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);
  final HomeController _controller = Get.find();
  InboxRepository _inboxRepository = InboxRepository();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                      child: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: ClipOval(
                          child: Image(
                            image: NetworkImage(widget.persona.foto),
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.persona.nombre} ${widget.persona.apellido}",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text("Genero: ${widget.persona.genero}"),
                        Text("Edad: 24"),
                        Text("Telefono: ${widget.persona.telefono}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                        TextSpan(text: "Direccion: ${widget.persona.direccion}")
                      ])),
                  RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                        TextSpan(text: "Email: ${widget.persona.email}")
                      ]))
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
                        TextSpan(text: widget.empleado.descripcion)
                      ])),
                  Text("Tarifa por Hora: "),
                  Text(widget.empleado.tarifa.toString() + "\$"),
                  Text("Empresa: " + widget.empleado.empresa),
                ],
              ),
            ),
            Center(
              child: Text("\nInsumos Extras: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: List.generate(widget.insumos.length,
                        (index) => Text(widget.insumos[index].nombre + ": ")),
                  ),
                  Column(
                    children: List.generate(
                        widget.insumos.length,
                        (index) => Text(
                            widget.insumos[index].tarifa.toString() + "\$")),
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
                      await _inboxRepository.postInbox(
                          widget.persona.idPersona, _controller?.currentUserId),
                      await Get.to(() => ChatUI(persona: widget.persona),
                          transition: Transition.fadeIn),
                    })
          ],
        ),
      ),
    );
  }
}
