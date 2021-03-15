class UsuarioModel {
  int idUsuario;
  String calificacion;

//  Usuario Usuario;
  UsuarioModel({
    this.idUsuario,
    this.calificacion,
  });

  static UsuarioModel fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      idUsuario: json['idUsuario'],
      calificacion: json['calificacion'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "calificacion": calificacion,
      };
}
