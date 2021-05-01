import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/route_manager.dart';

import 'package:life_point/models/usuario_model.dart';
import 'package:life_point/provider/usuario/usuario_repository.dart';
import 'package:life_point/screens/chat/list_inbox/list_inbox_ui.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _usuarioRepository = UsuarioRepository();
  final _streamcontroller = StreamController<String>.broadcast();
  Stream<String> get mensajes => _streamcontroller.stream;

  initNotifications(UsuarioModel currerUserModel) {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print("tuken:" + token);
      if (currerUserModel.personaModel.notyKey != token) {
        currerUserModel.personaModel.notyKey = token;
      }
      _usuarioRepository.putUsuario(currerUserModel, null);
    });
    _firebaseMessaging.configure(onMessage: (info) async {
      print("========On Mensaje========" + "yea");

      _streamcontroller.sink.add(null);
      print(info);
    }, onLaunch: (info) async {
      print("========On Launch========");
      _streamcontroller.sink.add(null);
      Get.to(() => ListInboxUI(), transition: Transition.fadeIn);
      print(info);
    }, onResume: (info) async {
      print("========On Resune========");
      _streamcontroller.sink.add(null);
      Get.to(() => ListInboxUI(), transition: Transition.fadeIn);
      print(info);
    });
  }

  dispose() {
    _streamcontroller.close();
  }
}
