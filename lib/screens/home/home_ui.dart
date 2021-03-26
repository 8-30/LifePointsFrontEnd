import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/screens/auth/login/login_ui.dart';
import 'package:life_point/screens/home/components/body.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logOut = GetStorage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Servicios"),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              print(logOut.read("usuarioID"));
              Get.snackbar(
                  "ID USER AUTENTICADO", logOut.read("usuarioID").toString());
            },
          )
        ],
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logOut
              .remove("usuarioID")
              .then((value) => Get.offAll(() => LoginUI()));
        },
        child: Icon(Icons.close),
        backgroundColor: Colors.green,
      ),
    );
  }
}
