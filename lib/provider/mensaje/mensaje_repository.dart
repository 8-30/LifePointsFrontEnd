import 'package:life_point/models/mensaje_model.dart';

import 'package:life_point/provider/mensaje/mensaje_provider.dart';

class MensajeRepository {
  MensajeApiProvider _apiProvider = MensajeApiProvider();

  Future<List<MensajeModel>> getAllMensajes() {
    return _apiProvider.getAllMensajes();
  }

  Future<List<MensajeModel>> getMensajeEmpleado(id) {
    return _apiProvider.getMensajeEmpleado(id);
  }

  Future<MensajeModel> getMensajeid(id) {
    return _apiProvider.getMensajeid(id);
  }

  Future<MensajeModel> postMensaje(model, id) {
    return _apiProvider.postMensaje(model, id);
  }
}
