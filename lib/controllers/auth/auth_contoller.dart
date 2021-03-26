import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/models/usuario_model.dart';
import 'package:life_point/screens/home/home_ui.dart';
import '../../provider/usuario/usuario_repository.dart';

class AuthController extends GetxController {
  final usuarioIDStorage = GetStorage();
  UsuarioRepository _usuarioApiProvider = UsuarioRepository();
  String email = "jipsonmurillo@gmail.com";
  String password = "Jipson11.";

  int id = 0;
  bool authEnable = false;
  UsuarioModel _usuarioModel = UsuarioModel();
  UsuarioModel _userCreatedModel = UsuarioModel();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController directionController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController gender = TextEditingController();

  RxString dropDownValue = RxString();
  RxList<String> addListCategories =
      ["Masculino", "Femenino", "Indefinido"].obs;

  @override
  void onReady() {
    getUserAuth();
    super.onReady();
  }

  void loginButtom() async {
    // print("email: " + emailController.text);

    // if ((emailController.text == email) &&
    //     (passwordController.text == password)) {
    //   authEnable = true;
    //   print("User Auth");
    //   Get.to(() => HomeUI());
    // } else {
    //   Get.snackbar(
    //     "ERROR",
    //     "Error de auntenticacion",
    //     icon: Icon(Icons.close),
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    // }
    // PersonaModel personaModel = PersonaModel();
    try {
      final personaModel = await _usuarioApiProvider.authUsuario(
          usernameController.text.trim(), passwordController.text.trim());
      if (personaModel.usuario == usernameController.text.trim()) {
        print("SE AUTENTICO EL SUSAIO: " + personaModel.usuario);
        await usuarioIDStorage.write("usuarioID", personaModel.idPersona);
        Get.offAll(() => HomeUI());
      } else {
        print("no auth");
      }
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "USUARIO O CONTRASEÑA INCORRECTOS",
        icon: Icon(Icons.close),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void registerButtom() async {
    _usuarioModel.calificacion = "0";
    _usuarioModel.apellido = lastnameController.text;
    _usuarioModel.credencial = ciController.text;
    _usuarioModel.direccion = directionController.text;
    _usuarioModel.email = emailController.text;
    _usuarioModel.foto = "URL PHoto";
    _usuarioModel.genero = dropDownValue.value;
    _usuarioModel.nacimiento = DateTime.now();
    _usuarioModel.nombre = nameController.text;
    _usuarioModel.telefono = phoneNumberController.text;
    _usuarioModel.contrasenia = passwordController.text;
    _usuarioModel.usuario = usernameController.text.trim();
    try {
      _userCreatedModel = await _usuarioApiProvider.postUsuario(_usuarioModel);
      if (_userCreatedModel.idUsuario != null) {
        print("SE CREO USUARIO: " + _userCreatedModel.idUsuario.toString());
        await usuarioIDStorage.write("usuarioID", _userCreatedModel.idUsuario);
        Get.offAll(() => HomeUI());
      } else {
        Get.snackbar(
          "ERROR",
          "usuario no creado",
          icon: Icon(Icons.close),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "No se pudo crear un nuevo usuario",
        icon: Icon(Icons.close),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getUserAuth() {
    int userID = usuarioIDStorage.read("usuarioID");
    print(userID);
    if (userID != null) {
      Get.offAll(() => HomeUI());
    } else {
      print("USUARIO NO AUTENTICADO");
    }
  }
}