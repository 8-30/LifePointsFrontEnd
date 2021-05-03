import 'package:life_point/models/person_model.dart';

class UsuarioModel {
  int idUsuario;
  String calificacion;
  bool enable;
  PersonaModel personaModel;
  UsuarioModel({
    this.idUsuario,
    this.calificacion,
    this.enable,
    this.personaModel,
  });

  static UsuarioModel fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
        idUsuario: json['idUsuario'],
        calificacion: json['calificacion'].toString(),
        enable: json['enable'],
        personaModel: PersonaModel.fromJson(json['persona']));
  }

  static UsuarioModel fromJson2(Map<String, dynamic> json) {
    return UsuarioModel(
      idUsuario: json['idUsuario'],
      calificacion: json['calificacion'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "calificacion": calificacion,
        "enable": enable,
        "idPersona": personaModel.idPersona,
        "nombre": personaModel.nombre,
        "apellido": personaModel.apellido,
        "nacimiento": "1997-10-10",
        "email": personaModel.email,
        "direccion": personaModel.direccion,
        "telefono": personaModel.telefono,
        "genero": personaModel.genero,
        "foto": personaModel.foto,
        "credencial": personaModel.credencial,
        "contrasenia": personaModel.contrasenia,
        "usuario": personaModel.usuario,
        "notyKey": personaModel.notyKey
      };
}
