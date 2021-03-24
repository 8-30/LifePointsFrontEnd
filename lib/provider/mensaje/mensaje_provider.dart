import 'package:dio/dio.dart';
import 'package:life_point/models/mensaje_model.dart';

class MensajeApiProvider {
  final String _endpoint = "http://lifepoints.herokuapp.com/api/mensaje/";
  final Dio _dio = Dio();

  Future<List<MensajeModel>> getAllMensajes() async {
    List<MensajeModel> mensajeList = List<MensajeModel>();
    try {
      Response response = await _dio.get(_endpoint);
      print(response.data["mensaje"]);
      for (var data in response.data["mensaje"]) {
        mensajeList.add(MensajeModel.fromJson(data));
      }
      return mensajeList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<MensajeModel>> getMensajeEmpleado(id) async {
    List<MensajeModel> mensajeList = List<MensajeModel>();
    try {
      Response response =
          await _dio.get(_endpoint + "empleado/" + id.toString());
      print(response.data["mensajes"]);
      for (var data in response.data["mensajes"]) {
        mensajeList.add(MensajeModel.fromJson(data));
      }
      return mensajeList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<MensajeModel> getMensajeid(id) async {
    try {
      Response response = await _dio.get(_endpoint + id.toString());
      print(response);
      return MensajeModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<MensajeModel> postMensaje(String texto, int id) async {
    try {
      MensajeModel mensaje =
          new MensajeModel(idMensaje: null, idInbox: id, texto: texto);
      print("no");
      print(mensaje.toJson());
      Response response = await _dio.post(_endpoint, data: mensaje.toJson());
      return null;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
