import 'package:life_point/models/inbox_model.dart';
import 'package:life_point/provider/inbox/inbox_provider.dart';

class InboxRepository {
  InboxApiProvider _apiProvider = InboxApiProvider();

  Future<List<InboxModel>> getAllInboxs() {
    return _apiProvider.getAllInboxs();
  }

  Future<List<InboxModel>> getInboxEmpleado(id) {
    return _apiProvider.getInboxEmpleado(id);
  }

  Future<InboxModel> getInboxid(id) {
    return _apiProvider.getInboxid(id);
  }
}
