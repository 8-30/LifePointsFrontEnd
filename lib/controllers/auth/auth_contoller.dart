import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/controllers/auth/auth.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/models/usuario_model.dart';
import 'package:life_point/screens/home/home_ui.dart';
import '../../provider/usuario/usuario_repository.dart';

class AuthController extends GetxController with Auth {
  final usuarioIDStorage = GetStorage();
  UsuarioRepository _usuarioApiProvider = UsuarioRepository();

  UsuarioModel _usuarioModel = UsuarioModel();
  UsuarioModel _userCreatedModel = UsuarioModel();

  RxString dropDownValue = "Masculino".obs;
  RxList<String> addListCategories =
      ["Masculino", "Femenino", "Indefinido"].obs;

  @override
  void onReady() {
    getUserAuth();
    super.onReady();
  }

  void loginButtom() async {
    try {
      final response = await _usuarioApiProvider.autenticacionUsuario(
          usernameController.text.trim(), passwordController.text.trim());
      if (response != null) {
        if (response.data["usuario"] == usernameController.text.trim()) {
          print("AUTENTICACION CORRECTA");
          int uid = response.data["idPersona"];
          await usuarioIDStorage.write("usuarioID", uid);
          Get.offAll(() => HomeUI());
        }
      } else {
        Get.snackbar(
          "ERROR",
          "USUARIO O CONTRASEÑA INCORRECTOS",
          icon: Icon(Icons.close),
          snackPosition: SnackPosition.BOTTOM,
        );
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
    _usuarioModel.enable = true;
    PersonaModel newPersona = PersonaModel();
    newPersona.apellido = lastnameController.text;
    newPersona.credencial = ciController.text;
    newPersona.direccion = directionController.text;
    newPersona.email = emailController.text;
    newPersona.foto = "URL PHoto";
    newPersona.genero = dropDownValue.value;
    newPersona.nacimiento = DateTime.now();
    newPersona.nombre = nameController.text;
    newPersona.telefono = phoneNumberController.text;
    newPersona.contrasenia = passwordController.text;
    newPersona.usuario = usernameController.text.trim();
    _usuarioModel.personaModel = newPersona;
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
