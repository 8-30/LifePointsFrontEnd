import 'package:life_point/provider/administrador_repository.dart';
import 'package:life_point/models/person_model.dart';
import 'package:rxdart/rxdart.dart';

class AdministradorBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<PersonaModel> _subject =
      BehaviorSubject<PersonaModel>();

  getUser() async {
    PersonaModel response = await _repository.getUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonaModel> get subject => _subject;
}
