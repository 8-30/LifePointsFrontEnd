import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:life_point/controllers/controllers.dart' show AuthController;
import 'package:life_point/screens/ui.dart';
import 'package:life_point/screens/widgets/TextFormFieldWithIcon.dart';

class BodyLogin extends StatelessWidget {
  final AuthController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          FormInputFieldWithIcon(
            controller: _controller.emailController,
            keyboardType: TextInputType.emailAddress,
            iconPrefix: Icons.account_circle,
            labelText: "Correo",
            onSaved: (value) => _controller.emailController.text = value,
          ),
          FormInputFieldWithIcon(
            controller: _controller.passwordController,
            iconPrefix: Icons.lock,
            labelText: "Contraseña",
            obscureText: true,
            onSaved: (value) => _controller.passwordController.text = value,
            maxLines: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "No tienes cuenta? "),
                WidgetSpan(
                    child: GestureDetector(
                  onTap: () => Get.to(() => RegisterUI()),
                  child: Text(
                    "Crear Cuenta".toLowerCase(),
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 15),
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text("Iniciar sesión".toUpperCase()),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            textColor: Colors.white,
            color: Colors.green[400],
            elevation: 5.0,
            onPressed: () => _controller.loginButtom(),
          )
        ],
      ),
    );
  }
}
