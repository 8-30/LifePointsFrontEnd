import 'package:flutter/material.dart';
import 'package:life_point/screens/servicio/components/body.dart';

class DetalleServicioUI extends StatelessWidget {
  const DetalleServicioUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del Servicios"),
      ),
      body: ServicioBody(),
    );
  }
}
