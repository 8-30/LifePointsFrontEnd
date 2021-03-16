class PersonaModel {
  int idPersona;
  String nombre;
  String apellido;
  String nacimiento;
  String email;
  String direccion;
  String telefono;
  String genero;
  String foto;
  String credencial;

//  Persona persona;
  PersonaModel({
    this.idPersona,
    this.nombre,
    this.apellido,
    this.nacimiento,
    this.email,
    this.direccion,
    this.telefono,
    this.genero,
    this.foto,
    this.credencial,
  });

  static PersonaModel fromJson(Map<String, dynamic> json) {
    return PersonaModel(
      idPersona: json['idPersona'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      nacimiento: null,
      email: json['email'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      genero: json['genero'],
      foto: json['foto'],
      credencial: json['credencial'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idPersona": idPersona,
        "nombre": nombre,
        "apellido": apellido,
        "nacimiento": nacimiento,
        "email": email,
        "direccion": direccion,
        "telefono": telefono,
        "genero": genero,
        "foto": foto,
        "credencial": credencial
      };
}
