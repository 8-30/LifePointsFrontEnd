import 'package:flutter/material.dart';
import 'package:life_point/screens/widgets/TextFormFieldWithIcon.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({Key key}) : super(key: key);

  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  @override
  Widget build(BuildContext context) {
    /*  String nombre;+
        String apellido;+
        DateTime nacimiento;
        String email;+
        String direccion;+
        String telefono;+
        String genero;-
        String foto;-
        String credencial;+ */
    int _value = 1;
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            FormInputFieldWithIcon(
              iconPrefix: Icons.account_circle,
              labelText: "Nombre",
            ),
            FormInputFieldWithIcon(
              iconPrefix: Icons.account_circle_sharp,
              labelText: "Apellido",
            ),
            FormInputFieldWithIcon(
              iconPrefix: Icons.mail_outline_sharp,
              labelText: "Correo Electronico",
            ),
            FormInputFieldWithIcon(
              iconPrefix: Icons.map_sharp,
              labelText: "Direccion",
            ),
            FormInputFieldWithIcon(
              iconPrefix: Icons.phone,
              labelText: "Numero Telefonico",
            ),
            FormInputFieldWithIcon(
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
