import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/controllers/auth/auth.dart';
import 'package:life_point/controllers/home/home_binding.dart';
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

  RxInt userID = RxInt();
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
          usernameController.clear();
          passwordController.clear();
          print("---------AUTENTICACION CORRECTA---------------------");
          userID.value = response.data["idPersona"];
          await usuarioIDStorage.write("usuarioID", userID.value);
          Get.offAll(() => HomeUI(), binding: HomeBinding());
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
    newPersona.notyKey = "1";
    _usuarioModel.personaModel = newPersona;
    try {
      _userCreatedModel = await _usuarioApiProvider.postUsuario(_usuarioModel);
      if (_userCreatedModel.idUsuario != null) {
        print("SE CREO USUARIO: " + _userCreatedModel.idUsuario.toString());
        await usuarioIDStorage.write("usuarioID", _userCreatedModel.idUsuario);
        userID.value = _userCreatedModel.idUsuario;
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
    userID.value = usuarioIDStorage.read("usuarioID");
    print("Se econtro un usuario: ${userID.value}");
    if (userID.value != null) {
      Get.offAll(() => HomeUI(), binding: HomeBinding());
    } else {
      print("USUARIO NO AUTENTICADO");
    }
  }
}
