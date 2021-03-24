import 'package:dio/dio.dart';
import 'package:life_point/models/inbox_model.dart';

class InboxApiProvider {
  final String _endpoint = "http://lifepoints.herokuapp.com/api/inbox/";
  final Dio _dio = Dio();

  Future<List<InboxModel>> getAllInboxs() async {
    List<InboxModel> inboxList = List<InboxModel>();
    try {
      Response response = await _dio.get(_endpoint);
      print(response.data["inbox"]);
      for (var data in response.data["inbox"]) {
        inboxList.add(InboxModel.fromJson(data));
      }
      return inboxList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<InboxModel>> getInboxEmpleado(id) async {
    List<InboxModel> inboxList = List<InboxModel>();
    try {
      Response response =
          await _dio.get(_endpoint + "empleado/" + id.toString());
      print(response.data["inboxs"]);
      for (var data in response.data["inboxs"]) {
        inboxList.add(InboxModel.fromJson(data));
      }
      return inboxList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<InboxModel> getInboxid(id) async {
    try {
      Response response = await _dio.get(_endpoint + id.toString());
      print(response);
      return InboxModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
