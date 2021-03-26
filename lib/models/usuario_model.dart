import 'package:life_point/models/person_model.dart';

class UsuarioModel extends PersonaModel {
  int idUsuario;
  String calificacion;

  UsuarioModel({
    idPersona,
    nombre,
    apellido,
    nacimiento,
    email,
    direccion,
    telefono,
    genero,
    foto,
    credencial,
    contrasenia,
    usuario,
    this.idUsuario,
    this.calificacion,
  });

  static UsuarioModel fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      idUsuario: json['idUsuario'],
      calificacion: json['calificacion'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      nacimiento: null,
      email: json['email'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      genero: json['genero'],
      foto: json['foto'],
      credencial: json['credencial'],
      contrasenia: json['contrasenia'],
      usuario: json['usuario'],
    );
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
        "idPersona": idPersona,
        "nombre": nombre,
        "apellido": apellido,
        "nacimiento": "1997-10-10",
        "email": email,
        "direccion": direccion,
        "telefono": telefono,
        "genero": genero,
        "foto": foto,
        "credencial": credencial,
        "contrasenia": contrasenia,
        "usuario": usuario,
      };
}
