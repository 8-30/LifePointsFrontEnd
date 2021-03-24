import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_point/screens/home/home_ui.dart';

class AuthController extends GetxController {
  String email = "jipsonmurillo@gmail.com";
  String password = "Jipson11.";
  bool authEnable = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController directionController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController gender = TextEditingController();

  void loginButtom() {
    print("email: " + emailController.text);
    if ((emailController.text == email) &&
        (passwordController.text == password)) {
      authEnable = true;
      print("User Auth");
      Get.to(() => HomeUI());
    } else {
      Get.snackbar(
        "ERROR",
        "Error de auntenticacion",
        icon: Icon(Icons.close),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void registerButtom() {
    print("email: " + emailController.text);
    print("new user register");
  }
}
