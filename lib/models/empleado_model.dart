class EmpleadoModel {
  int idEmpleado;
  String empresa;
  String tarifa;
  String calificacion;
  String descripcion;

//  Empleado Empleado;
  EmpleadoModel({
    this.idEmpleado,
    this.empresa,
    this.tarifa,
    this.calificacion,
    this.descripcion,
  });

  static EmpleadoModel fromJson(Map<String, dynamic> json) {
    return EmpleadoModel(
      idEmpleado: json['idEmpleado'],
      empresa: json['empresa'],
      tarifa: json['tarifa'],
      calificacion: json['calificacion'],
      descripcion: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idEmpleado": idEmpleado,
        "empresa": empresa,
        "tarifa": tarifa,
        "calificacion": calificacion,
        "descripcion": descripcion,
      };
}
