import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/screens/servicio/detalle_servicio_ui.dart';

class CardPresentation extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);

  final EmpleadoModel empleado;
  CardPresentation({
    Key key,
    this.empleado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
          () => DetalleServicioUI(
                persona: empleado.persona,
              ),
          transition: Transition.fadeIn),
      child: Card(
        color: Colors.black54,
        elevation: 8.0,
        child: ListTile(
          leading: CircleAvatar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            radius: 30.0,
            child: ClipOval(
              child: Image(
                image: NetworkImage(empleado.persona.foto),
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
          title: Text(empleado.persona.nombre + " " + empleado.persona.apellido,
              style: estiloTexto),
          subtitle: Text(
              empleado.nombreServicio +
                  "\n" +
                  empleado.persona.direccion +
                  "\n" +
                  "Tarifa: " +
                  empleado.tarifa.toString() +
                  "\$",
              style: estiloTexto),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
