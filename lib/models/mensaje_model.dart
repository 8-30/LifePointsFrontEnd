class MensajeModel {
  int idMensaje;
  int idInbox;
  String texto;

  MensajeModel({this.idMensaje, this.idInbox, this.texto});

  static MensajeModel fromJson(Map<String, dynamic> json) {
    return MensajeModel(
      idMensaje: json['idMensaje'],
      idInbox: json['idInbox'],
      texto: json['texto'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idMensaje": idMensaje,
        "idInbox": idInbox,
        "texto": texto,
      };
}
