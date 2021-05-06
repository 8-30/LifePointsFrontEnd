import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/controllers/auth/auth_contoller.dart';
import 'package:life_point/models/usuario_model.dart';
import 'package:life_point/provider/notifications/push_notification_provider.dart';
import 'package:life_point/provider/usuario/usuario_repository.dart';
import 'package:life_point/screens/ui.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find();
  final UsuarioRepository usuarioRepository = UsuarioRepository();
  final userID = GetStorage();
  final pushNotificationProvider = new PushNotificationProvider();
  int currentUserId;
  UsuarioModel currerUserModel;

  @override
  void onReady() async {
    getCurrentUser();
    ever(authController.userID, handleAuthChanged);
    super.onReady();
  }

  void howCurrentUser() {
    Get.snackbar(
        "ID USER AUTENTICADO",
        "HOLA: ${currerUserModel.personaModel.nombre} ${currerUserModel.personaModel.apellido}" +
            " ID: ${currerUserModel.personaModel.idPersona}",
        icon: Icon(
          Icons.info,
          color: Colors.red,
        ),
        snackPosition: SnackPosition.BOTTOM);
  }

  void logOut() {
    userID.remove("usuarioID").then((value) {
      authController.userID.value = null;
      Get.offAll(() => LoginUI());
    });
  }

  void handleAuthChanged(_userID) async {
    print("Home ever uid: $_userID");
    if (_userID != null)
      currerUserModel = await usuarioRepository.getCurrentUsuario(_userID);
  }

  void getCurrentUser() async {
    currentUserId = await userID.read("usuarioID");
    currerUserModel = await usuarioRepository.getCurrentUsuario(currentUserId);
    pushNotificationProvider.initNotifications(currerUserModel);
    pushNotificationProvider.mensajes.listen((event) {});
  }

  void updateUsuario(UsuarioModel model, File file) async {
    currerUserModel.personaModel.nombre = model.personaModel.nombre;
    currerUserModel.personaModel.apellido = model.personaModel.apellido;
    currerUserModel.personaModel.email = model.personaModel.email;
    currerUserModel.personaModel.telefono = model.personaModel.telefono;
    currerUserModel.personaModel.credencial = model.personaModel.credencial;
    currerUserModel.personaModel.direccion = model.personaModel.direccion;
    final data = await usuarioRepository.putUsuario(currerUserModel, file);
    if (!data) {
      Get.snackbar("ERROR", "NO SE PUDO ACTUALIZAR EL USUARIO",
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
