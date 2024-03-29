import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/models/usuario_model.dart';

class UsuarioApiProvider {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final String _endpoint = "http://lifepoints.herokuapp.com/api/usuario/";
  final Dio _dio = Dio();

  Future<UsuarioModel> postUsuario(UsuarioModel usuarioModel) async {
    try {
      print(usuarioModel.toJson());
      Response response =
          await _dio.post(_endpoint, data: usuarioModel.toJson());
      print(response.data);
      return UsuarioModel.fromJson2(response.data['usuario']);
    } catch (error) {
      print("Exception occured: $error ");
      return null;
    }
  }

  Future<PersonaModel> authUsuario(String usuario, String contrasenia) async {
    try {
      Response response =
          await _dio.get(_endpoint + "username/$usuario/password/$contrasenia");
      //print(response.data['persona']);
      return PersonaModel.fromJson(response.data['persona']);
    } catch (error) {
      print("Exception occured: $error ");
      return null;
    }
  }

  Future<dynamic> autenticacionUsuario(
      String usuario, String contrasenia) async {
    try {
      Response response = await _dio.post(_endpoint + "/autenticacion",
          data: {"usuario": usuario, "contrasenia": contrasenia});
      //print(response.data["idPersona"]);
      return response;
    } catch (error) {
      print("Exception occured: $error ");
      return null;
    }
  }

  Future<UsuarioModel> getCurrentUsuario(int uid) async {
    try {
      Response response = await _dio.get(_endpoint + uid.toString());
      print(response.data['usuario']);
      return UsuarioModel.fromJson(response.data['usuario']);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<dynamic> putUsuario(UsuarioModel model, File file) async {
    try {
      if (file != null) {
        model.personaModel.foto =
            await uploadImage(file, model.personaModel.usuario);
      }
      Response response = await _dio.put(_endpoint + model.idUsuario.toString(),
          data: model.toJson());
      print(response.data);
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<dynamic> uploadImage(File file, String userName) async {
    return await firebaseStorage
        .ref()
        .child("users")
        .child(userName)
        .child('${basename(userName)}')
        .putFile(file)
        .then((value) {
      return value.ref.getDownloadURL();
    });
  }
}
