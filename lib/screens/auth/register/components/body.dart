import 'package:flutter/material.dart';
import 'package:life_point/screens/widgets/TextFormFieldWithIcon.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point/controllers/controllers.dart' show AuthController;

class BodyRegister extends StatefulWidget {
  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final AuthController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            FormInputFieldWithIcon(
              controller: _controller.nameController,
              iconPrefix: Icons.account_circle,
              labelText: "Nombre",
            ),
            FormInputFieldWithIcon(
              controller: _controller.lastnameController,
              iconPrefix: Icons.account_circle_sharp,
              labelText: "Apellido",
            ),
            FormInputFieldWithIcon(
              controller: _controller.emailController,
              iconPrefix: Icons.mail_outline_sharp,
              labelText: "Correo Electronico",
            ),
            FormInputFieldWithIcon(
              controller: _controller.directionController,
              iconPrefix: Icons.map_sharp,
              labelText: "Direccion",
            ),
            FormInputFieldWithIcon(
              controller: _controller.phoneNumberController,
              iconPrefix: Icons.phone,
              labelText: "Numero Telefonico",
            ),
            FormInputFieldWithIcon(
              controller: _controller.ciController,
              iconPrefix: Icons.card_travel,
              labelText: "Numero de indentificación",
            ),
            DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(child: Text("Masculino"), value: 1),
                  DropdownMenuItem(child: Text("Femenino"), value: 2),
                  DropdownMenuItem(child: Text("Indefinido"), value: 3),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
            RaisedButton(
              child: Text("Crear Cuenta".toUpperCase()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textColor: Colors.white,
              color: Colors.green[400],
              elevation: 5.0,
              onPressed: () => print("Crear cuenta"),
            )
          ],
        ),
      ),
    );
  }
}
