import 'package:dio/dio.dart';

import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/inbox_model.dart';
import 'package:life_point/provider/Inbox/inbox_repository.dart';
import 'package:life_point/provider/empleado/empleado_repository.dart';

class NotifyApiProvider {
  final String _endpoint = "https://fcm.googleapis.com/fcm/send";
  final Dio _dio = Dio();
  InboxRepository _inboxRepository = InboxRepository();
  EmpleadoRepository _empleadoRepository = EmpleadoRepository();

  Future<void> sendNotify(
      String mensaje, int idInbox, int idEmisor, String nombre) async {
    InboxModel inbox = await _inboxRepository.getInboxid(idInbox);
    EmpleadoModel empleado = new EmpleadoModel();
    if (inbox.persona1 == idEmisor) {
      empleado = await _empleadoRepository.getEmpleado(inbox.persona2);
    } else {
      empleado = await _empleadoRepository.getEmpleado(inbox.persona1);
    }
    print(empleado.persona.notyKey);
    try {
      Map<String, dynamic> noti = {
        "to": empleado.persona.notyKey,
        "notification": {
          "title": nombre,
          "body": mensaje,
          "sound": "default",
          "tag": "sms"
        },
        "data": {}
      };
      await _dio.post(_endpoint,
          data: noti,
          options: Options(
            headers: {
              "Authorization":
                  "key=AAAA1Z1jYms:APA91bG8TH68WVTx30xFOHTsRrRwRDUj2rida7RxNUuQfDa7TML7OLHtnDriXMawKYAnnFxLxWbbnqczWWjEsmhmwQII4g-Stb5tL12hTdrPXd7WE-Kb52da2fsHoMNWaSuIeLr91GYs"
            },
          ));
    } catch (error) {
      print(error);
    }
  }
}
